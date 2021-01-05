import 'package:flutter/material.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/widgets/info_dialog.dart';

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
          buildInfoListTile(
              context, "order_explanation_title", "order_explanation"),
          buildInfoListTile(
              context, "payment_explanation_title", "payment_explanation"),
        ],
      ),
    );
  }

  ListTile buildInfoListTile(
      BuildContext context, String title, String explanation) {
    return ListTile(
      title: Text(AppLocalizations.of(context).translate(title)),
      onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) => InfoDialog(
              title: AppLocalizations.of(context).translate(title),
              content: AppLocalizations.of(context).translate(explanation))),
    );
  }
}
