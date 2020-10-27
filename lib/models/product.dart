import 'dart:core';

import 'package:flutter/material.dart';
import 'package:shapp/models/category.dart';
import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String name;
  final String brand;
  Image image;
  Category category;
  final double price;
  final Map<String, dynamic> info;

  Product({this.id, this.name, this.brand, String image, String category, this.price, this.info}) {
    this.image = (image == null)
        ? Image.asset('assets/images/map.png')
        : Image.network(image, loadingBuilder: (context, child, progress) {
          return progress == null ? child : Center(child: CircularProgressIndicator());
    },);
    this.category = productCategories.containsKey(category) ? productCategories[category] : productCategories['none'];
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, brand: $brand, image: $image, category: $category, price: $price, info: $info}';
  }


}