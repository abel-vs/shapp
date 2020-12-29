import 'package:flutter/material.dart';
import 'package:shapp/services/app_localizations.dart';

class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context).translate("frequent_questions")),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)
                .translate("payment_explanation_title")),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text(
                  AppLocalizations.of(context)
                      .translate("payment_explanation_title"),
                  style: Theme.of(context).textTheme.headline3,
                ),
                content: Text(AppLocalizations.of(context)
                    .translate("payment_explanation")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
