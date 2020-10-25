class Category {
  final String name;
  final String image;

  Category({this.name, this.image});

  @override
  String toString() {
    return 'Category{name: $name, image: $image}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Category &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              image == other.image;

  @override
  int get hashCode =>
      name.hashCode ^
      image.hashCode;





}

Map<String, Category> get shopCategories {
  return {
    'supermarket': Category(name: "supermarket", image: "assets/images/shops/supermarket.png"),
    'clothing': Category(name: "clothing", image: "assets/images/shops/boutique.png"),
    'diy': Category(name: "diy", image: "assets/images/shops/repair_services.png"),
    'animals': Category(name: "animals", image: "assets/images/shops/pet_shop.png"),
    'delicacies': Category(name: "delicacies", image: "assets/images/shops/delicatessen.png"),
    'barber': Category(name: "barber", image: "assets/images/shops/barber_shop.png"),
    'jewelry': Category(name: "jewelry", image: "assets/images/shops/jewelry.png"),
    'toys': Category(name: "toys", image: "assets/images/shops/toy_store.png"),
    'electronics': Category(name: "electronics", image: "assets/images/shops/electronics_shop.png"),
    'books': Category(name: "books", image: "assets/images/shops/bookstore.png"),
    'furniture': Category(name: "furniture", image: "assets/images/shops/furniture_store.png"),
    'restaurant': Category(name: "restaurant", image: "assets/images/shops/restaurant.png"),
    'sports': Category(name: "sports", image: "assets/images/shops/sports_store.png"),
    'florist': Category(name: "florist", image: "assets/images/shops/florist.png"),
    'fruits': Category(name: "fruits", image: "assets/images/shops/fruit_shop.png"),
    'fish': Category(name: "fish", image: "assets/images/shops/fish_shop.png"),
  };
}

Map<String, Category> get productCategories {
  return {
    'food': Category(name: "food", image: "assets/images/products/basket.png"),
    'drinks': Category(name: "drinks", image: "assets/images/products/drinks.png"),
    'health': Category(name: "health", image: "assets/images/products/health.png"),
    'beauty': Category(name: "beauty", image: "assets/images/products/cosmetics.png"),
  };
}
