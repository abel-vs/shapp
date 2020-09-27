class Category {
  final String name;
  final String image;

  Category({this.name, this.image});
}

class Categories {

  get shopCategories {
    return [
      supermarket,
      clothing,
      diy,
      animals,
      delicacies,
      barber,
      jewelry,
      toys,
      electronics,
      books,
      furniture,
      restaurant,
      sports,
      florist,
      fruits,
      fish
    ];
  }

  final supermarket = Category(
      name: "supermarket", image: "assets/images/shops/supermarket.png");
  final clothing =
      Category(name: "clothing", image: "assets/images/shops/boutique.png");
  final diy =
      Category(name: "diy", image: "assets/images/shops/repair_services.png");
  final animals =
      Category(name: "animals", image: "assets/images/shops/pet_shop.png");
  final delicacies = Category(
      name: "delicacies", image: "assets/images/shops/delicatessen.png");
  final barber =
      Category(name: "barber", image: "assets/images/shops/barber_shop.png");
  final jewelry =
      Category(name: "jewelry", image: "assets/images/shops/jewelry.png");
  final toys =
      Category(name: "toys", image: "assets/images/shops/toy_store.png");
  final electronics = Category(
      name: "electronics", image: "assets/images/shops/electronics_shop.png");
  final books =
      Category(name: "books", image: "assets/images/shops/bookstore.png");
  final furniture = Category(
      name: "furniture", image: "assets/images/shops/furniture_store.png");
  final restaurant =
      Category(name: "restaurant", image: "assets/images/shops/restaurant.png");
  final sports =
      Category(name: "sports", image: "assets/images/shops/sports_store.png");
  final florist =
      Category(name: "florist", image: "assets/images/shops/florist.png");
  final fruits =
      Category(name: "fruits", image: "assets/images/shops/fruit_shop.png");
  final fish =
      Category(name: "fish", image: "assets/images/shops/fish_shop.png");

  get productCategories{
    return [food, drinks, health, beauty];
  }

  final food = Category(name: "food", image:"assets/images/products/basket.png");
  final drinks = Category(name: "drinks", image:"assets/images/products/drinks.png");
  final health = Category(name: "health", image:"assets/images/products/health.png");
  final beauty = Category(name: "beauty", image:"assets/images/products/cosmetics.png");
}
