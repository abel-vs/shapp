import 'package:flutter/material.dart';
import 'package:shapp/widgets/expanded_button.dart';
import 'package:shapp/widgets/order_title_block.dart';

class OrderDescriptionPage extends StatefulWidget {
  @override
  _OrderDescriptionPageState createState() => _OrderDescriptionPageState();

  final PageController pageController;
  final TextEditingController descriptionController;

  OrderDescriptionPage({this.pageController, this.descriptionController});
}

class _OrderDescriptionPageState extends State<OrderDescriptionPage> {
  @override
  void initState() {
    widget.descriptionController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderTitleBlock(
          title: "Wat heb je nodig?",
          subtitle: "Beschrijf het hier en we gaan het voor je halen!",
        ),
        buildDescriptionField(),
        buildNextButton(context),
      ],
    );
  }

  Widget buildNextButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          ExpandedButton(
            text: "Volgende",
            function: widget.descriptionController.text.isEmpty
                ? null
                : () => widget.pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut),
          ),
        ],
      ),
    );
  }

  Widget buildDescriptionField() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          textAlignVertical: TextAlignVertical.top,
          controller: widget.descriptionController,
          decoration: InputDecoration(
            labelText: "Beschrijving",
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.all(20.0),
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.multiline,
          expands: true,
          maxLines: null,
        ),
      ),
    );
  }
}
