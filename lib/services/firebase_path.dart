class FirebasePath {
  static String products() => 'products';
  static String product(String pid) => 'products/$pid';
  static String stores() => 'stores';
  static String store(String sid) => 'stores/$sid';
  static String promotion(String pid) => 'promotions/$pid';
}