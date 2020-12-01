import 'package:code_input/code_input.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shapp/decorations/code_decoration.dart';
import 'package:shapp/services/auth.dart';
import 'package:shapp/widgets/expanded_button.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key key, this.phoneNumber}) : super(key: key);

  @override
  _VerifyPageState createState() => _VerifyPageState();
  final PhoneNumber phoneNumber;
}

class _VerifyPageState extends State<VerifyPage> {
  String otp = "";
  FocusNode focus = FocusNode();

  @override
  void initState() {
    focus.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<AuthBase>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).canvasColor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              width: double.maxFinite,
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Verificatie".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Theme.of(context).canvasColor, fontSize: 60),
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(color: Theme.of(context).canvasColor, fontSize: 16, fontFamily: 'Abel'),
                        children: [
                          TextSpan(text: "Code verstuurd naar "),
                          TextSpan(text: widget.phoneNumber.phoneNumber, style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                  SizedBox(height: kToolbarHeight),
                ],
              ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                CodeInput(
                  length: 6,
                  focusNode: focus,
                  keyboardType: TextInputType.number,
                  builder: codeDecoration(context),
                  onFilled: (value) => setState(() {
                    otp = value;
                  }),
                ),
                SizedBox(height: 20),
                TextButton(
                  child: Text(
                    "Verstuur nieuwe code".toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        ExpandedButton(
                          text: "Verifieer",
                          function: () {
                            Navigator.of(context).pop();
                            auth.signIn(otp);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
