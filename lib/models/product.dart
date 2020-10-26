import 'dart:core';

import 'package:shapp/models/category.dart';
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

  @override
  String toString() {
    return 'Product{id: $id, name: $name, image: $image, category: $category, price: $price, info: $info}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Product &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              image == other.image &&
              category == other.category &&
              price == other.price &&
              info == other.info;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      category.hashCode ^
      price.hashCode ^
      info.hashCode;










}