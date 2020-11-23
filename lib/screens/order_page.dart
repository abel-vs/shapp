import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/screens/order_description_page.dart';
import 'package:shapp/screens/order_details_page.dart';
import 'package:shapp/screens/order_pay_page.dart';
import 'package:shapp/screens/order_summary_page.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();

  final PageController pageController = PageController();
  final Order order = Order();
}

class _OrderPageState extends State<OrderPage> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bestelling"),
        actions: [
          DotsIndicator(
            dotsCount: 4,
            position: pageIndex.toDouble(),
            decorator: DotsDecorator(
              activeColor: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
      body: MultiProvider(
        providers: [
          Provider<Order>.value(value: widget.order),
          ListenableProvider<PageController>.value(value: widget.pageController),
        ],
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (value) => setState(() => pageIndex = value),
          controller: widget.pageController,
          children: [OrderDescriptionPage(), OrderDetailsPage(), OrderSummaryPage(), OrderPayPage()],
        ),
      ),
    );
  }
}
