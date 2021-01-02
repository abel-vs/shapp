import 'package:code_input/code_input.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shapp/decorations/code_decoration.dart';
import 'package:shapp/services/app_localizations.dart';
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
  bool _loading = false;

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
                    AppLocalizations.of(context).translate("verification").toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Theme.of(context).canvasColor, fontSize: 60),
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(color: Theme.of(context).canvasColor, fontSize: 16, fontFamily: 'Abel'),
                        children: [
                          TextSpan(text: AppLocalizations.of(context).translate("code_sent") + " "),
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
                    AppLocalizations.of(context).translate("code_new").toUpperCase(),
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
                          text: AppLocalizations.of(context).translate("verify"),
                          loading: _loading,
                          function: () async {
                            setState(() {
                              _loading = true;
                            });
                            await auth.signIn(otp);
                            setState(() {
                              _loading = false;
                            });
                            Navigator.of(context).popUntil((route) => route.isFirst);
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
