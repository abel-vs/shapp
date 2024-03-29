import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/services/firebase_path.dart';
import 'package:stripe_payment/stripe_payment.dart' as stripe;

import 'firestore_service.dart';

abstract class Database {
  makeUser();

  sendFeedback(String feedback);

  Future<void> placeOrder(Order order);

  Stream<Order> orderStream({@required String oid});

  Stream<List<Order>> ordersStream();

  Future<String> setImage(File image);
}

class FirestoreDatabase implements Database {
  final _service = FirestoreService.instance;
  final _storage = FirebaseStorage.instance;

  Function orderBuilder = (data, documentId) {
    DateTime deliveryMoment = data["deliveryMoment"].toDate();

    return Order(
      id: documentId,
      description: data["description"],
      deliveryDay: deliveryMoment,
      deliveryTime:
          TimeOfDay(hour: deliveryMoment.hour, minute: deliveryMoment.minute),
      asap: data["asap"],
      deliveryLocation: data["deliveryLocation"],
      pickUpLocation: data["pickUpLocation"],
      estimatedPrice: data["estimatedPrice"].toDouble(),
      deliveryCosts: data["deliveryCosts"].toDouble(),
      extraInfo: data["extraInfo"],
      source: stripe.Source(sourceId: data["stripeSource"]),
      state: data["state"],
      image: data["image"],
      rider: data["rider"],
    );
  };

  @override
  makeUser() {
    String uid = FirebaseAuth.instance.currentUser.uid;
    String phoneNumber = FirebaseAuth.instance.currentUser.phoneNumber;
    Map<String, dynamic> data = {
      'phoneNumber': phoneNumber,
    };
    _service.setData(path: FirebasePath.user(uid), data: data);
  }


  @override
  sendFeedback(String feedback) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    Map<String, dynamic> data = {
      'text': feedback,
      'user': uid,
      'createdAt': FieldValue.serverTimestamp()
    };
    _service.addData(path: FirebasePath.feedback(), data: data);
  }

  @override
  Future<void> placeOrder(Order order) async {
    String oid = order.source.sourceId.substring(
        4); //This gives all orders the same id as their stripe payment
    order.state = OrderState.Submitted;
    if (order.imageFile != null)
      await setImage(order.imageFile).then((downloadURL) {
        order.image = downloadURL;
      });
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

  @override
  Future<String> setImage(File image) async {
    String url;
    Reference storageReference =
        _storage.ref().child('orders/${basename(image.path)}');
    try {
      await storageReference.putFile(image);
      await storageReference
          .getDownloadURL()
          .then((downloadURL) => url = downloadURL);
    } on FirebaseException catch (e) {
      print("Exception: " + e.toString());
    }
    return url;
  }
}
