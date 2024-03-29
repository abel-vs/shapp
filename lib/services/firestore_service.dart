import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class FirestoreService {
  FirestoreService._();

  static final instance = FirestoreService._();

  Future<DocumentReference> addData({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.collection(path);
    print('add: $path: $data');
    return reference.add(data);
  }

  Future<void> setData({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('set: $path: $data');
    await reference.set(data);
  }

  Future<void> updateData({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('set: $path: $data');
    await reference.update(data);
  }

  Future<void> deleteData({@required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('delete: $path');
    await reference.delete();
  }

  Future<DocumentSnapshot> getData({@required String path}) async {
    assert(path != null);
    final reference = FirebaseFirestore.instance.doc(path);
    print('get: $path');
    return reference.get();
  }

  Future<DocumentReference> getReference({@required String path}) async {
    assert(path != null);
    final reference = FirebaseFirestore.instance.doc(path);
    print('get: $path');
    return reference;
  }

  Stream<List<T>> collectionStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data, String documentID),
    Query queryBuilder(Query query),
    int sort(T lhs, T rhs),
  }) {
    Query query = FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<T> documentStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data, String documentID),
  }) {
    final DocumentReference reference = FirebaseFirestore.instance.doc(path);
    final Stream<DocumentSnapshot> snapshots = reference.snapshots();
    return snapshots
        .map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  void executeTransaction({
    @required TransactionHandler transaction,
  }) {
    FirebaseFirestore.instance.runTransaction(transaction);
  }
}
