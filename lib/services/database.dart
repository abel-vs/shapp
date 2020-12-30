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

  Stream<List<Order>> ordersStream();
}

class FirestoreDatabase implements Database {
  final _service = FirestoreService.instance;

  Function orderBuilder = (data, documentId) {
    DateTime deliveryMoment = data["deliveryMoment"].toDate();
    return Order(
      id: documentId,
      description: data["description"],
      deliveryDay: deliveryMoment,
      deliveryTime: TimeOfDay(hour: deliveryMoment.hour, minute: deliveryMoment.minute),
      asap: data["asap"],
      deliveryLocation: data["deliveryLocation"],
      pickUpLocation: data["pickUpLocation"],
      estimatedPrice: data["estimatedPrice"].toDouble(),
      deliveryCosts: data["deliveryCosts"].toDouble(),
      extraInfo: data["extraInfo"],
      source: stripe.Source(sourceId: data["stripeSource"]),
      state: data["state"],
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
    String oid = order.source.sourceId.substring(4); //This gives all orders the same id as their stripe payment
    _service.setData(
      path: FirebasePath.order(oid),
      data: order.toJson(),
    );
  }

  @override
  Stream<Order> orderStream({String oid}) {
    return _service.documentStream(
      path: FirebasePath.order(oid),
      builder: orderBuilder,
    );
  }

  @override
  Stream<List<Order>> ordersStream() {
    print('Getting orders');
    String uid = FirebaseAuth.instance.currentUser.uid;
    return _service.collectionStream(
      path: FirebasePath.orders(),
      builder: orderBuilder,
      queryBuilder: (query) => query.where("user", isEqualTo: uid),
    );
  }
}
