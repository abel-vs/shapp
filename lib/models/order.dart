import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stripe_payment/stripe_payment.dart' as stripe;

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
    return this.isAsap() ? "Zo snel mogelijk" : this.format(context);
  }

  bool isAsap() {
    TimeOfDay now = TimeOfDay.now();
    return (this.hour < now.hour + 1) || (this.hour == now.hour + 1 && this.minute <= now.minute);
  }

// toRightTime

}

enum OrderState { Created, Submitted, Appointed, Bought, Delivery, Done }

class Order {
  String id;
  OrderState state;
  String description;
  DateTime deliveryDay;
  TimeOfDay deliveryTime;
  bool asap;
  String deliveryLocation;
  String pickUpLocation;
  double estimatedPrice;
  String extraInfo;
  stripe.Source source;

  Order({
    this.id,
    this.state = OrderState.Created,
    this.description = "",
    this.deliveryDay,
    this.deliveryTime,
    this.asap = true,
    this.deliveryLocation = "",
    this.pickUpLocation = "",
    this.estimatedPrice = 10,
    this.extraInfo = "",
    this.source,
  }) {
    if (this.deliveryDay == null) deliveryDay = DateTime.now();
    if (this.deliveryTime == null) deliveryTime = TimeExtension.asap();
  }

  Map<String, dynamic> toJson() {
    DateTime deliveryMoment = DateTime(
      deliveryDay.year,
      deliveryDay.month,
      deliveryDay.day,
      deliveryTime.hour,
      deliveryTime.minute,
    );

    return {
      'description': description,
      'extraInfo': extraInfo,
      'pickUpLocation': pickUpLocation,
      'deliveryLocation': deliveryLocation,
      'deliveryMoment': deliveryMoment,
      'asap': asap,
      'estimatedPrice': estimatedPrice,
      'stripeSource': source.sourceId,
      'createdAt': FieldValue.serverTimestamp(),
      'user': FirebaseAuth.instance.currentUser.uid,
    };
  }
}
