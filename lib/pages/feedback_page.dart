import 'package:provider/provider.dart';
import 'package:shapp/decorations/field_decoration.dart';
import 'package:shapp/pages/feedback_send_page.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:shapp/services/database.dart';
import 'package:shapp/widgets/expanded_button.dart';

import 'order_confirmed_page.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Database database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).translate("feedback"))),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("We houden van jullie feedback, twijfel dus niet om een idee of mening te delen!"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: TextField(
                  controller: feedbackController,
                  decoration: fieldDecoration(labelText: "Feedback"),
                  textAlignVertical: TextAlignVertical.top,
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  onChanged: (_) => setState((){}),
                ),
              ),
            ),
            Row(
              children: [
                ExpandedButton(
                    text: "Verstuur",
                    function: feedbackController.text.isEmpty
                        ? null
                        : () {
                            database.sendFeedback(feedbackController.text);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => FeedbackSentPage(),
                              ),
                            );
                          }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
