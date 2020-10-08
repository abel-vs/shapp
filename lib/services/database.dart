import 'package:Shapp/models/product.dart';
import 'package:Shapp/services/firebase_path.dart';

import 'firestore_service.dart';

abstract class Database {
  Stream<List<Product>> productsStream();
}

class FirestoreDatabase implements Database {
  final _service = FirestoreService.instance;

  @override
  Stream<List<Product>> productsStream() {
    return _service.collectionStream(path: FirebasePath.products(), builder: (data, documentID) {
      return Product(id: documentID, name: data['name'], image: data['image'], category: data['category'], price: 69, info: data['info']);
    });
  }

}
