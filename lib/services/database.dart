import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
}

class FirestoreDatabase implements Database {
  final _service = FirestoreService.instance;

  @override
  sendFeedback(String feedback) {
    Map<String, dynamic> data = {'text': feedback, 'user': FirebaseAuth.instance.currentUser.uid, 'createdOn': FieldValue.serverTimestamp()};
    _service.addData(path: FirebasePath.feedback(), data: data);
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
  //
  // @override
  // Stream<List<Product>> productsStream() {
  //   return _service.collectionStream(path: FirebasePath.products(), builder: productBuilder);
  // }
  //
  // @override
  // Stream<Product> productStream(String id) {
  //   return Rx.combineLatest2<Map<String, dynamic>, double, Product>(
  //       _service.documentStream(path: FirebasePath.product(id), builder: (data, documentID) => data),
  //       lowestProductPrice(id), (Map<String, dynamic> data, double price) {
  //     data.addEntries([MapEntry('price', price)]);
  //     return productBuilder(data, id);
  //   });
  // }
  //
  // @override
  // Stream<List<Product>> productCategoryStream(Category category) {
  //   return _service.collectionStream(
  //       path: FirebasePath.products(),
  //       builder: productBuilder,
  //       queryBuilder: (query) => query.where('category', isEqualTo: category.name));
  // }
  //
  // @override
  // Stream<List<Stream<Product>>> promotedProductsStream(String promotion) {
  //   return _service.documentStream(
  //       path: FirebasePath.promotion(promotion),
  //       builder: (data, documentID) {
  //         /// Gets a stream of all products in the specific promotion
  //         List<String> productIDs = data['products'].map<String>((e) => e.toString()).toList();
  //
  //         /// Maps each element of the stream, each new updated list of product IDs, to a list of Product Streams
  //         List<Stream<Product>> products = productIDs.map<Stream<Product>>((id) => productStream(id)).toList();
  //         return products;
  //       });
  // }
  //
  // @override
  // Stream<double> lowestProductPrice(String id) {
  //   Query query =
  //       FirebaseFirestore.instance.collection("products").doc(id).collection("stores").orderBy("price").limit(1);
  //   Stream<QuerySnapshot> snapshots = query.snapshots();
  //   Stream<double> price = snapshots.map((snapshot) => snapshot.docs.first.data()['price'].toDouble());
  //   return price;
  // }
}
