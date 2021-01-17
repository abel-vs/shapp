import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shapp/services/app_localizations.dart';
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
            : this.asWeekDay + " " + DateFormat('dd-MM-yyyy').format(this);
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

  String toReadableString(context, bool today) {
    return today && this.lessThanOneHour() ? "Zo snel mogelijk" : this.format(context);
  }

  bool lessThanOneHour() {
    TimeOfDay now = TimeOfDay.now();
    return (this.hour < now.hour + 1) || (this.hour == now.hour + 1 && this.minute <= now.minute);
  }

// toRightTime

}

enum OrderState { Submitted, Collecting, Delivering, Done }

extension OrderStateExtension on OrderState {
  String toReadableString(BuildContext context) {
    switch (this) {
      case OrderState.Submitted:
        return AppLocalizations.of(context).translate("order_submitted");
      case OrderState.Collecting:
        return AppLocalizations.of(context).translate("order_collecting");
      case OrderState.Delivering:
        return AppLocalizations.of(context).translate("order_delivering");
      case OrderState.Done:
        return AppLocalizations.of(context).translate("order_delivered");
      default:
        return AppLocalizations.of(context).translate("no_status");
    }
  }

  IconData toStatusIcon() {
    switch (this) {
      case OrderState.Submitted:
        return Icons.send;
      case OrderState.Collecting:
        return Icons.shopping_cart;
      case OrderState.Delivering:
        return Icons.directions_bike;
      case OrderState.Done:
        return Icons.check_circle;
      default:
        return Icons.help_outline;
    }
  }

  double toPercentage(){
    switch (this) {
      case OrderState.Submitted:
        return 0.2;
      case OrderState.Collecting:
        return 0.5;
      case OrderState.Delivering:
        return 0.8;
      case OrderState.Done:
        return 1;
      default:
        return 0;
    }
  }

  bool hasPassed(OrderState state){
    return this.toPercentage() <= state.toPercentage();
  }


  static OrderState create(String state){
    switch (state) {
      case "OrderState.Submitted":
        return OrderState.Submitted;
      case "OrderState.Collecting":
        return OrderState.Collecting;
      case "OrderState.Delivering":
        return OrderState.Delivering;
      case "OrderState.Done":
        return OrderState.Done;
      default:
        return null;
    }
  }

}

class Order {
  String id;
  OrderState state;
  String description;
  DateTime deliveryDay;
  TimeOfDay deliveryTime;
  bool asap;
  bool delivered;
  String deliveryLocation;
  String pickUpLocation;
  double estimatedPrice;
  double deliveryCosts;
  String extraInfo;
  stripe.Source source;
  String image;
  File imageFile;
  String rider;

  bool get today{
    return DateTime.now().isSameDate(this.deliveryDay);
  }

  Order({
    this.id,
    String state,
    this.image,
    this.description = "",
    this.deliveryDay,
    this.deliveryTime,
    this.asap = true,
    this.deliveryLocation = "",
    this.pickUpLocation = "",
    this.estimatedPrice = 10,
    this.deliveryCosts = 2,
    this.extraInfo = "",
    this.source,
    this.rider,
  }) {
    this.state = OrderStateExtension.create(state);
    this.delivered = this.state == OrderState.Done;
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
      'deliveryCosts': deliveryCosts,
      'stripeSource': source.sourceId,
      'createdAt': FieldValue.serverTimestamp(),
      'user': FirebaseAuth.instance.currentUser.uid,
      'state': state.toString(),
      'image': image,
      'rider': rider,
    };
  }
}
