import 'dart:developer';

import 'package:Shapp/models/category.dart';
import 'package:Shapp/models/product.dart';
import 'package:Shapp/services/firebase_path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firestore_service.dart';

abstract class Database {
  Stream<List<Product>> productsStream();

  Stream<List<Product>> productCategoryStream(Category category);
}

class FirestoreDatabase implements Database {
  final _service = FirestoreService.instance;

  Function productBuilder = (data, documentID) {
    return Product(
        id: documentID,
        name: data['name'],
        image: data['image'],
        category: data['category'],
        price: data['price'],
        info: data['info']);
  };

  @override
  Stream<List<Product>> productsStream() {
    return _service.collectionStream(
        path: FirebasePath.products(), builder: productBuilder);
  }

  @override
  Stream<List<Product>> productCategoryStream(Category category) {
    return _service.collectionStream(
        path: FirebasePath.products(),
        builder: productBuilder,
        queryBuilder: (query) =>
            query.where('category', isEqualTo: category.name));
  }
}
