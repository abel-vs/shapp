import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shapp/widgets/expanded_button.dart';
import 'package:shapp/widgets/field_decoration.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              width: double.maxFinite,
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SHAPP",
                    style: TextStyle(fontSize: 80, color: Theme.of(context).canvasColor),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Alles uit je stad.",
                    style: TextStyle(fontSize: 20, color: Theme.of(context).canvasColor),
                  ),Text(
                    "Binnen het uur geleverd.",
                    style: TextStyle(fontSize: 20, color: Theme.of(context).canvasColor),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputDecorator(
                    decoration: InputDecoration(
                      labelText: "Telefoonnummer",
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.only(left: 20),
                      border: OutlineInputBorder(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: InternationalPhoneNumberInput(
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.DIALOG,
                          showFlags: true,
                          backgroundColor: Theme.of(context).canvasColor,
                        ),
                        searchBoxDecoration: InputDecoration(hintText: "Zoek op naam of land code"),
                        locale: "nl",
                        inputDecoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "06 12 34 56 78",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        ExpandedButton(
                          text: "Registreer",
                          function: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
