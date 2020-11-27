import 'package:code_input/code_input.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shapp/services/auth.dart';
import 'package:shapp/widgets/expanded_button.dart';
import 'package:shapp/widgets/field_decoration.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();

  final PageController pageController = PageController();
}

class _SignInPageState extends State<SignInPage> {
  PhoneNumber number = PhoneNumber(isoCode: 'NL');
  String otp = "";

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: buildTitle(context),
          ),
          Flexible(
            flex: 2,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (value) => setState(() => pageIndex = value),
              controller: widget.pageController,
              children: [buildPhoneNumberView(context), buildVerifyView(context)],
            ),
          ),
        ],
      ),
    );
  }

  Column buildVerifyView(BuildContext context) {
    Auth auth = Provider.of<AuthBase>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CodeInput(
          length: 6,
          keyboardType: TextInputType.number,
          builder: CodeInputBuilders.containerized(
            totalSize: Size.fromRadius(30),
            emptySize: Size.fromRadius(10),
            filledSize: Size.fromRadius(25),
            emptyDecoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Theme
                  .of(context)
                  .primaryColor, width: 2.0),
              color: Theme
                  .of(context)
                  .canvasColor,
            ),
            filledDecoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Theme
                  .of(context)
                  .primaryColor, width: 3.0),
              color: Theme
                  .of(context)
                  .primaryColor,
            ),
            emptyTextStyle: TextStyle(
              color: Theme
                  .of(context)
                  .canvasColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            filledTextStyle: TextStyle(
              color: Theme
                  .of(context)
                  .canvasColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onFilled: (value) => otp = value,
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                ExpandedButton(
                  text: "Verifieer",
                  function: () => auth.signIn(otp),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container buildTitle(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: Theme
          .of(context)
          .primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "SHAPP",
            style: TextStyle(fontSize: 80, color: Theme
                .of(context)
                .canvasColor),
          ),
          SizedBox(height: 10),
          Text(
            "As quick as a click.",
            style: TextStyle(fontSize: 20, color: Theme
                .of(context)
                .canvasColor),
          ),
        ],
      ),
    );
  }

  Widget buildPhoneNumberView(BuildContext context) {
    Auth auth = Provider.of<AuthBase>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
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
                  backgroundColor: Theme
                      .of(context)
                      .canvasColor,
                ),
                searchBoxDecoration: InputDecoration(hintText: "Zoek op naam of land code"),
                locale: "nl",
                initialValue: number,
                onInputChanged: (value) =>
                    setState(() {
                      number = value;
                    }),
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
                  function: number.toString() == null || number
                      .toString()
                      .isEmpty
                      ? null
                      : () {
                    auth.verifyPhone(number.toString());
                    widget.pageController
                        .nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
