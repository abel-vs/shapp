import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shapp/screens/order_description_page.dart';
import 'package:shapp/screens/order_details_page.dart';
import 'package:shapp/screens/order_summary_page.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();

  final PageController pageController = PageController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dayController = TextEditingController();
}

class _OrderPageState extends State<OrderPage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bestelling"),
        actions: [
          DotsIndicator(
            dotsCount: 3,
            position: pageIndex.toDouble(),
            decorator: DotsDecorator(
              activeColor: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        controller: widget.pageController,
        children: [
          OrderDescriptionPage(
            pageController: widget.pageController,
            descriptionController: widget.descriptionController,
          ),
          OrderDetailsPage(
            pageController: widget.pageController,
            timeController: widget.timeController,
            dayController: widget.dayController,
          ),
          OrderSummaryPage(widget.pageController),
        ],
      ),
    );
  }
}
