import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/auth.dart';
import 'package:shapp/widgets/expanded_button.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'NL');
  TextEditingController phoneController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        // Create an inner BuildContext so that the onPressed methods
        // can refer to the Scaffold with Scaffold.of().
        builder: (BuildContext context) => buildPhoneNumberView(context),
      ),
    );
  }

  Container buildTitle(BuildContext context) {
    return Container(
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
            "As quick as a click.",
            style: TextStyle(fontSize: 20, color: Theme.of(context).canvasColor),
          ),
        ],
      ),
    );
  }

  Widget buildPhoneNumberView(BuildContext context) {
    Auth auth = Provider.of<AuthBase>(context);

    return Column(
      children: [
        Flexible(
          flex: 3,
          child: buildTitle(context),
        ),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                InputDecorator(
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).translate("phone_number"),
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: InternationalPhoneNumberInput(
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.DIALOG,
                              showFlags: true,
                              backgroundColor: Theme.of(context).canvasColor,
                            ),
                            searchBoxDecoration: InputDecoration(
                                hintText: AppLocalizations.of(context).translate("search_country_code")),
                            locale: "nl",
                            initialValue: phoneNumber,
                            textFieldController: phoneController,
                            // selectorButtonOnErrorPadding: 0,
                            // autoValidateMode: AutovalidateMode.always,
                            onInputChanged: (value) => setState(() {
                              phoneNumber = value;
                            }),
                            inputDecoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "06 12 34 56 78",
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => setState(() {
                          phoneNumber = PhoneNumber(isoCode: 'NL');
                          phoneController.clear();
                          loading = false;
                        }),
                        splashColor: Colors.transparent,
                        splashRadius: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Provider.value(
                        value: loading,
                        child: ExpandedButton(
                          text: AppLocalizations.of(context).translate("register"),
                          function: phoneNumber.toString() == null || phoneNumber.toString().isEmpty
                              ? null
                              : () => auth.verifyPhone(phoneNumber, context),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).translate("policy_note"),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      children: [
                        TextButton(
                          child: Text(AppLocalizations.of(context).translate("general_conditions")),
                          onPressed: () => Navigator.of(context).pushNamed('general_conditions'),
                        ),
                        Spacer(),
                        TextButton(
                          child: Text(AppLocalizations.of(context).translate("privacy_policy")),
                          onPressed: () => Navigator.of(context).pushNamed('privacy_policy'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
