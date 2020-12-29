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

enum OrderStatus { Submitted, Collecting, Delivering, Done }

extension OrderStatusExtension on OrderStatus {
  String toReadableString(BuildContext context) {
    switch (this) {
      case OrderStatus.Submitted:
        return AppLocalizations.of(context).translate("order_submitted");
      case OrderStatus.Collecting:
        return AppLocalizations.of(context).translate("order_collecting");
      case OrderStatus.Delivering:
        return AppLocalizations.of(context).translate("order_delivering");
      case OrderStatus.Done:
        return AppLocalizations.of(context).translate("order_delivered");
      default:
        return AppLocalizations.of(context).translate("no_status");
    }
  }

  IconData toStatusIcon() {
    switch (this) {
      case OrderStatus.Submitted:
        return Icons.send;
      case OrderStatus.Collecting:
        return Icons.shopping_cart;
      case OrderStatus.Delivering:
        return Icons.directions_bike;
      case OrderStatus.Done:
        return Icons.check_circle;
      default:
        return Icons.help_outline;
    }
  }

  double toPercentage(){
    switch (this) {
      case OrderStatus.Submitted:
        return 0.2;
      case OrderStatus.Collecting:
        return 0.5;
      case OrderStatus.Delivering:
        return 0.8;
      case OrderStatus.Done:
        return 1;
      default:
        return 0;
    }
  }

  bool hasPassed(OrderStatus state){
    return this.toPercentage() <= state.toPercentage();
  }


  static OrderStatus create(String state){
    switch (state) {
      case "OrderState.Submitted":
        return OrderStatus.Submitted;
      case "OrderState.Collecting":
        return OrderStatus.Collecting;
      case "OrderState.Delivering":
        return OrderStatus.Delivering;
      case "OrderState.Done":
        return OrderStatus.Done;
      default:
        return null;
    }
  }

}

class Order {
  String id;
  OrderStatus state;
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

  Order({
    this.id,
    String state,
    this.description = "",
    this.deliveryDay,
    this.deliveryTime,
    this.asap = true,
    this.delivered = false,
    this.deliveryLocation = "",
    this.pickUpLocation = "",
    this.estimatedPrice = 10,
    this.deliveryCosts = 2,
    this.extraInfo = "",
    this.source,
  }) {
    this.state = OrderStatusExtension.create(state);
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
      'delivered': delivered,
      'asap': asap,
      'estimatedPrice': estimatedPrice,
      'deliveryCosts': deliveryCosts,
      'stripeSource': source.sourceId,
      'createdAt': FieldValue.serverTimestamp(),
      'user': FirebaseAuth.instance.currentUser.uid,
      'state': state.toString(),
    };
  }
}
