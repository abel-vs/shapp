import 'package:flutter/material.dart';
import 'package:shapp/services/app_localizations.dart';

class LocationSelectionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        AppLocalizations.of(context).translate("choose_location"),
        style: Theme.of(context).textTheme.headline2,
      ),
      contentPadding: EdgeInsets.only(top: 20),
      content: Container(
        width: double.maxFinite,
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Text(AppLocalizations.of(context).translate("choose_location_message")),
            ),
            // ListView(
            //   shrinkWrap: true,
            //   children: [
            //     RadioListTile(
            //       value: false,
            //       title: Text(AppLocalizations.of(context).translate("current_location")),
            //       onChanged: (value) {},
            //     ),
            //     Divider(
            //       height: 0,
            //     ),
            //     ListTile(
            //       contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
            //       leading: Icon(Icons.add),
            //       title: Text(AppLocalizations.of(context).translate("add_address")),
            //       onTap: () {},
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
