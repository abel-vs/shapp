import 'package:flutter/material.dart';
import 'package:shapp/pages/info_page.dart';
import 'package:shapp/services/app_localizations.dart';

class FeedbackSentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfoPage(
      icon: Icons.tag_faces,
      title: AppLocalizations.of(context).translate("feedback_thanks"),
      body: Container(),
    );
  }
}
