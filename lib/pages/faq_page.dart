import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/remote_config.dart';
import 'package:shapp/widgets/info_dialog.dart';

class FaqPage extends StatelessWidget {
  RemoteConfigService remoteConfigService;

  @override
  Widget build(BuildContext context) {
    remoteConfigService = Provider.of<RemoteConfigService>(context);
    Map<String, String> questions =
        remoteConfigService.questions(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("frequent_questions")),
      ),
      body: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            String title = questions.keys.elementAt(index);
            String explanation = questions.values.elementAt(index);
            return buildInfoListTile(context, title, explanation);
          }),
    );
  }

  ListTile buildInfoListTile(BuildContext context, String title, String explanation) => ListTile(
        title: Text(title),
        onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) => InfoDialog(
            title: title,
            content: explanation,
          ),
        ),
      );
}
