import 'opening_hour.dart';

class Shop{
  final String id;
  final String name;
  final String type;
  final String city;
  final String street;
  final int houseNumber;
  final String image;
  final List<OpeningHour> openingHours;

  Shop(this.id, this.name, this.type, this.city, this.street, this.houseNumber, this.image, this.openingHours);


}