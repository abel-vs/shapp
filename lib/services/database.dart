import 'dart:developer';

import 'package:shapp/models/category.dart';
import 'package:shapp/models/product.dart';
import 'package:shapp/services/firebase_path.dart';

import 'firestore_service.dart';

abstract class Database {
  Stream<Product> productStream(String id);

  Stream<List<Product>> productsStream();

  Stream<List<Product>> productCategoryStream(Category category);

  Stream<List<Stream<Product>>> promotedProductsStream(String promotion);

  Stream<double> lowestProductPrice(String id);
}

class FirestoreDatabase implements Database {
  final _service = FirestoreService.instance;

  Function productBuilder = (data, documentID) {
    return Product(
        id: documentID,
        name: data['name'],
        brand: data['brand'],
        image: data['image'],
        category: data['category'],
        price: data['price'],
        info: data['info']);
  };

  Function testBuilder = (documentID) {
    return documentID;
  };

  @override
  Stream<List<Product>> productsStream() {
    return _service.collectionStream(path: FirebasePath.products(), builder: productBuilder);
  }

  @override
  Stream<Product> productStream(String id) {
    return _service.documentStream(path: FirebasePath.product(id), builder: productBuilder);
  }

  @override
  Stream<List<Product>> productCategoryStream(Category category) {
    return _service.collectionStream(
        path: FirebasePath.products(),
        builder: productBuilder,
        queryBuilder: (query) => query.where('category', isEqualTo: category.name));
  }

  @override
  Stream<List<Stream<Product>>> promotedProductsStream(String promotion) {
    return _service.documentStream(
        path: FirebasePath.promotion(promotion),
        builder: (data, documentID) {
          /// Gets a stream of all products in the specific promotion
          List<String> productIDs = data['products'].map<String>((e) => e.toString()).toList();

          /// Maps each element of the stream, each new updated list of product IDs, to a list of Product Streams
          List<Stream<Product>> products = productIDs.map<Stream<Product>>((id) => productStream(id)).toList();
          return products;
        });
  }

  @override
  Stream<double> lowestProductPrice(String id) {
    Stream<dynamic> price = _service.collectionStream(
        path: FirebasePath.productStores(id),
        builder: (data, documentID) => data['price'],
        queryBuilder: (query) => query.orderBy("price").limit(1));
    log(price.toString());
    return null;
  }
}
