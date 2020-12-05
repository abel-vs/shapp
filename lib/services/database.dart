import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/services/firebase_path.dart';

import 'firestore_service.dart';

abstract class Database {
  // Stream<Product> productStream(String id);
  //
  // Stream<List<Product>> productsStream();
  //
  // Stream<List<Product>> productCategoryStream(Category category);
  //
  // Stream<List<Stream<Product>>> promotedProductsStream(String promotion);
  //
  // Stream<double> lowestProductPrice(String id);

  sendFeedback(String feedback);

  Future<void> placeOrder(Order order);
}

class FirestoreDatabase implements Database {
  final _service = FirestoreService.instance;

  @override
  sendFeedback(String feedback) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    Map<String, dynamic> data = {'text': feedback, 'user': uid, 'createdAt': FieldValue.serverTimestamp()};
    _service.addData(path: FirebasePath.feedback(), data: data);
  }

  @override
  Future<void> placeOrder(Order order) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    DateTime day = order.deliveryDay;
    TimeOfDay time = order.deliveryTime;
    DateTime deliveryMoment = DateTime(day.year, day.month, day.day, time.hour, time.minute);

    /// MAKE DOCUMENT IN ORDERS
    Map<String, dynamic> orderData = {
      'description': order.description,
      'extraInfo': order.extraInfo,
      'pickUpLocation': order.pickUpLocation,
      'deliveryLocation': order.deliveryLocation,
      'deliveryMoment': deliveryMoment,
      'asap': order.asap,
      'estimatedPrice': order.estimatedPrice,
      'stripeSource': order.source.sourceId,
      'createdAt': FieldValue.serverTimestamp(),
    };

    DocumentReference orderReference = await _service.addData(path: FirebasePath.orders(), data: orderData);

    /// MAKE DOCUMENT IN USER/UID/ORDERS
    Map<String, dynamic> orderReferenceData = {'orderReference': orderReference};
    _service.setData(
      path: FirebasePath.user(uid) + "/" + FirebasePath.order(orderReference.id),
      data: orderReferenceData,
    );
  }

// Function productBuilder = (data, documentID) {
//   return Product(
//       id: documentID,
//       name: data['name'],
//       brand: data['brand'],
//       image: data['image'],
//       category: data['category'],
//       price: data['price'],
//       info: data['info']);
// };

}
