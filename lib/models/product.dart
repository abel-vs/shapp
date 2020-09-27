import 'dart:core';

import 'package:Shapp/models/category.dart';

class Product {
  final String id;
  final String name;
  final String image;
  final Category category;
  final double price;
  final Map<String, dynamic> productInformation;

  Product(this.id, this.name, this.image, this.category, this.price,
      this.productInformation);
}

class Products{
  final product1 = Product("id", "name", "assets/images/AlbertHeijnXL.jpg", Categories().health, 4.20, {"Coolness": 999});
}
