import 'dart:core';

import 'package:flutter/material.dart';
import 'package:shapp/models/category.dart';

class Product {
  final String id;
  final String name;
  final String brand;
  final String image;
  Category category;
  final double price;
  final Map<String, dynamic> info;

  Product({this.id, this.name, this.brand, this.image, String category, this.price, this.info}) {
    this.category = productCategories.containsKey(category) ? productCategories[category] : productCategories['none'];
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, brand: $brand, image: $image, category: $category, price: $price, info: $info}';
  }
}
