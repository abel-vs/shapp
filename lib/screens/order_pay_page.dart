import 'package:flutter/material.dart';
import 'package:shapp/widgets/expanded_button.dart';
import 'package:shapp/widgets/order_title_block.dart';

class OrderPayPage extends StatefulWidget {
  @override
  _OrderPayPageState createState() => _OrderPayPageState();

  final PageController pageController;

  const OrderPayPage({this.pageController});
}

class _OrderPayPageState extends State<OrderPayPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderTitleBlock(
          title: "Time to pay",
          subtitle: "Via iDeal Biitch",
        ),
        Spacer(),
        buildButtons(context),
      ],
    );
  }

  Widget buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Row(
          children: [
            ExpandedButton(
              text: "Terug",
              function: () {
                widget.pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
              },
            ),
            SizedBox(width: 10),
            ExpandedButton(
              text:  "Betaal",
              function: null,
            ),
          ],
        ),
      ),
    );
  }
}
