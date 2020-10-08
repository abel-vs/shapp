import 'dart:core';

import 'package:Shapp/models/category.dart';
import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String name;
  Image image;
  Category category;
  final double price;
  final Map<String, dynamic> info;

  Product({this.id, this.name, String image, String category, this.price, this.info}) {
    this.image = (image == null)
        ? Image( image: AssetImage('assets/images/map.png'))
        : Image(image: NetworkImage(image));
    this.category = productCategories.containsKey(category) ? productCategories[category] : productCategories['none'];
  }
}