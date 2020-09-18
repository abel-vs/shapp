import 'dart:core';

import 'opening_hour.dart';

class Product{
  final String id;
  final String name;
  final String image;
  final String category;
  final double price;
  final Map<String, dynamic> productInformation;
  final List<OpeningHour> openingHours;

  Product(this.id, this.name, this.image, this.category, this.price,
      this.productInformation, this.openingHours);


}