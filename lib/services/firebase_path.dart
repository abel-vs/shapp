class FirebasePath {
  static String orders() => 'orders';
  static String order(String oid) => 'orders/$oid';
  static String feedback() => 'feedback';
  static String user(String uid) => 'users/$uid';
  static String userOrders(String uid) => 'users/$uid/orders';
  static String userOrder(String uid, String oid) => 'users/$uid/orders/$oid';
}