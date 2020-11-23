import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year && this.month == other.month && this.day == other.day;
  }

  String toReadableString() {
    return this.isSameDate(DateTime.now())
        ? "Vandaag"
        : this.isSameDate(DateTime.now().add(Duration(days: 1)))
            ? "Morgen"
            : this.asWeekDay + " " + DateFormat('dd-MM').format(this);
  }

  // ignore: missing_return
  String get asWeekDay {
    switch (this.weekday) {
      case DateTime.monday:
        return "Maandag";
      case DateTime.tuesday:
        return "Dinsdag";
      case DateTime.wednesday:
        return "Woensdag";
      case DateTime.thursday:
        return "Donderdag";
      case DateTime.friday:
        return "Vrijdag";
      case DateTime.saturday:
        return "Zaterdag";
      case DateTime.sunday:
        return "Zondag";
    }
  }
}

extension TimeExtension on TimeOfDay {
  static TimeOfDay asap() {
    return TimeOfDay(hour: TimeOfDay.now().hour + 1, minute: TimeOfDay.now().minute);
  }

  String toReadableString(context) {
    return this.isAsap()
        ? "Zo snel mogelijk"
        : this.format(context);
  }


  bool isAsap(){
    TimeOfDay now = TimeOfDay.now();
    return (this.hour < now.hour + 1) || (this.hour == now.hour + 1 && this.minute <= now.minute);
  }

  // toRightTime


}

enum OrderState { Created, Submitted, Appointed, Bought, Delivery, Done }

class Order {
  String id;
  OrderState state = OrderState.Created;
  String description = "";
  DateTime deliveryDay = DateTime.now();
  TimeOfDay deliveryTime = TimeExtension.asap();
  String deliveryLocation = "";
  String pickUpLocation = "";
  double estimatedPrice = 10;
}
