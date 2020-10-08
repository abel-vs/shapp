import 'dart:core';

import 'package:Shapp/models/category.dart';

class Product {
  final String id;
  final String name;
  final String image;
  final Category category;
  final double price;
  final Map<String, dynamic> info;

  Product({this.id, this.name, this.image, this.category, this.price,
      this.info});
}

class Products{
  final product1 = Product(id: "id", name: "name", image: "assets/images/AlbertHeijnXL.jpg", category: Categories().health, price: 4.20, info: {"Coolness": 999});
}
