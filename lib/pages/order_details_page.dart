import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:provider/provider.dart';
import 'package:shapp/decorations/field_decoration.dart';
import 'package:shapp/models/location_picker.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/pages/map_page.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/validators.dart';
import 'package:shapp/widgets/expanded_button.dart';
import 'package:shapp/widgets/order_title_block.dart';

class OrderDetailsPage extends StatefulWidget {
  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  PageController pageController;
  Order order;
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dayController = TextEditingController();
  final TextEditingController pickUpController = TextEditingController();
  final TextEditingController deliveryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    order = Provider.of<Order>(context);
    pageController = Provider.of<PageController>(context);
    dayController.text = order.deliveryDay.toReadableString();
    timeController.text = order.deliveryTime.toReadableString(context, order.today);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderTitleBlock(
            title: AppLocalizations.of(context).translate("details_title"),
            subtitle: AppLocalizations.of(context).translate("details_subtitle"),
          ),
          buildFields(context),
          buildButtons(context),
        ],
      ),
    );
  }

  Widget buildFields(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    buildPickUpLocationField(),
                    SizedBox(height: 10),
                    buildDeliveryLocationField(),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        buildDayField(context),
                        SizedBox(width: 10),
                        buildTimeField(context),
                      ],
                    ),
                    SizedBox(height: 10),
                    buildPriceField(context),
                    SizedBox(height: 10),
                    buildExtraInfoField(),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildExtraInfoField() {
    return Expanded(
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        decoration: fieldDecoration(labelText: AppLocalizations.of(context).translate("extra_info")),
        keyboardType: TextInputType.multiline,
        minLines: null,
        maxLines: null,
        expands: true,
        onChanged: (text) => setState(() => order.extraInfo = text),
        initialValue: order.extraInfo,
      ),
    );
  }

  InputDecorator buildPriceField(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).translate("price"),
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
        border: OutlineInputBorder(),
      ),
      child: Row(
        children: [
          Text(
              AppLocalizations.of(context).translate("approximately") + " €" + order.estimatedPrice.toStringAsFixed(0)),
          Expanded(
            child: Slider(
                value: order.estimatedPrice,
                onChanged: (price) => setState(() => order.estimatedPrice = price),
                min: 10,
                max: 50,
                divisions: 4,
                label: '€${order.estimatedPrice.toStringAsFixed(0)}'),
          ),
        ],
      ),
    );
  }

  Widget buildTimeField(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text(AppLocalizations.of(context).translate("asap")),
                          onTap: () {
                            setState(() {
                              order.deliveryDay = DateTime.now();
                              order.deliveryTime = TimeExtension.asap();
                              timeController.text = order.deliveryTime.toReadableString(context, order.today);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        Divider(height: 0),
                        ListTile(
                          title: Text(AppLocalizations.of(context).translate("choose_other_time")),
                          onTap: () async {
                            TimeOfDay time = await showTimePicker(
                              context: context,
                              initialTime: TimeExtension.asap(),
                            );
                            if (time != null) {
                              setState(() {
                                order.deliveryTime = time;
                                timeController.text = order.deliveryTime.toReadableString(context, order.today);
                              });
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ));
        },
        readOnly: true,
        controller: timeController,
        decoration: fieldDecoration(labelText: AppLocalizations.of(context).translate("time")),
      ),
    );
  }

  Widget buildDayField(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onTap: () async {
          DateTime day = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 7)),
          );
          if (day != null) {
            setState(() {
              order.deliveryDay = day;
              dayController.text = day.toReadableString();
            });
          }
        },
        readOnly: true,
        controller: dayController,
        decoration: fieldDecoration(labelText: AppLocalizations.of(context).translate("day")),
      ),
    );
  }

  Widget buildPickUpLocationField() {
    return TextFormField(
      onTap: () async {
        LocationResult location = await pickLocation(context);
        setState(() {
          order.pickUpLocation = location.address ?? "";
          pickUpController.text = location.address ?? "";
        });
      },
      onChanged: (text) => setState(() => order.pickUpLocation = text),
      // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapPage())),
      readOnly: true,
      controller: pickUpController,
      decoration: fieldDecoration(
        labelText: AppLocalizations.of(context).translate("where_to_find"),
        hintText: AppLocalizations.of(context).translate("where_to_find_hint"),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => locationValidator(context, value),
    );
  }

  Widget buildDeliveryLocationField() {
    return TextFormField(
      onTap: () async {
        LocationResult location = await pickLocation(context);
        setState(() {
          order.deliveryLocation = location.address ?? "";
          deliveryController.text = location.address ?? "";
        });
      },
      onChanged: (text) => setState(() => order.deliveryLocation = text),
      readOnly: true,
      controller: deliveryController,
      decoration: fieldDecoration(
        labelText: AppLocalizations.of(context).translate("where_to_deliver"),
        hintText: AppLocalizations.of(context).translate("where_to_deliver_hint"),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => locationValidator(context, value),
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
              text: AppLocalizations.of(context).translate("back"),
              function: () {
                pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
              },
            ),
            SizedBox(width: 10),
            ExpandedButton(
              text: AppLocalizations.of(context).translate("next"),
              function: () {
                if (_formKey.currentState.validate()) {
                  pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
