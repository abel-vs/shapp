import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/services/firebase_path.dart';
import 'package:stripe_payment/stripe_payment.dart' as stripe;

import 'firestore_service.dart';

abstract class Database {

  sendFeedback(String feedback);

  Future<void> placeOrder(Order order);

  Stream<Order> orderStream({@required String oid});

  Stream<List<Stream<Order>>> ordersStream({@required String uid});
}

class FirestoreDatabase implements Database {
  final _service = FirestoreService.instance;

  Function orderBuilder = (data, documentId) {
    return Order(
      id: documentId,
      description: data["description"],
      deliveryDay: data["deliveryMoment"],
      deliveryTime: TimeOfDay(hour: data["deliveryMoment"].hour, minute: data["deliveryMoment"].minute),
      asap: data["asap"],
      deliveryLocation: data["deliveryLocation"],
      pickUpLocation: data["pickUpLocation"],
      estimatedPrice: data["estimatedPrice"],
      extraInfo: data["extraInfo"],
      source: stripe.Source.fromJson(data['stripeSource']),
    );
  };

  @override
  sendFeedback(String feedback) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    Map<String, dynamic> data = {'text': feedback, 'user': uid, 'createdAt': FieldValue.serverTimestamp()};
    _service.addData(path: FirebasePath.feedback(), data: data);
  }

  @override
  Future<void> placeOrder(Order order) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    String oid = order.source.sourceId.substring(4); //This gives all orders the same id as their stripe payment

    TransactionHandler transactionHandler = (transaction) async {
      /// MAKE DOCUMENT IN ORDERS
      Map<String, dynamic> orderData = order.toJson();

      DocumentReference orderReference = FirebaseFirestore.instance.doc(FirebasePath.order(oid));

      transaction.set(orderReference, orderData);

      /// MAKE DOCUMENT IN USER/UID/ORDERS
      Map<String, dynamic> userOrderData = {
        'orderReference': FirebaseFirestore.instance.doc(FirebasePath.order(oid)),
      };

      DocumentReference userOrderReference =
      FirebaseFirestore.instance.doc(FirebasePath.userOrder(uid, oid));

      transaction.set(userOrderReference, userOrderData);

      return null;
    };

    _service.executeTransaction(transaction: transactionHandler);
  }

  @override
  Stream<Order> orderStream({String oid}) {
    _service.documentStream(
        path: FirebasePath.order(oid),
        builder: orderBuilder,
    );
  }

  @override
  Stream<List<Stream<Order>>> ordersStream({String uid}) {
    return _service.collectionStream(path: FirebasePath.userOrders(uid), builder: (data, documentId) => orderStream(oid: documentId));
  }

}
