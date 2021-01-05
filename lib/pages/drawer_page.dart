import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/auth.dart';
import 'package:shapp/themes.dart';
import 'package:share/share.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<AuthBase>(context);

    return Drawer(
      child: ListTileTheme(
        iconColor: Theme.of(context).primaryColor,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Shapp'),
            automaticallyImplyLeading: false,
          ),
          body: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(AppLocalizations.of(context).translate("settings")),
                onTap: () => Navigator.of(context).pushNamed("settings"),
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text(AppLocalizations.of(context).translate("spread_the_love")),
                onTap: () => Share.share(AppLocalizations.of(context).translate("share_message"), subject: 'Shapp'),
              ),
              ListTile(
                  leading: Icon(Icons.star),
                  title: Text(AppLocalizations.of(context).translate("feedback")),
                  onTap: () => Navigator.of(context).pushNamed("feedback")),
              ListTile(
                leading: Icon(Icons.help_outline),
                title: Text(AppLocalizations.of(context).translate("frequent_questions")),
                onTap: () => Navigator.of(context).pushNamed("faq"),
              ),
              AboutListTile(
                icon: Icon(Icons.info_outline),
                applicationVersion: AppLocalizations.of(context).translate("version") + " 1.0.0",
                applicationLegalese: "©2021 Shapp",
                aboutBoxChildren: [
                  SizedBox(height: 20),
                  ListTile(
                      title: Text(AppLocalizations.of(context).translate("general_conditions")),
                      onTap: () {
                        Navigator.of(context).pushNamed("general_conditions");
                        Navigator.of(context, rootNavigator: true).pop();
                      }),
                  ListTile(
                      title: Text(AppLocalizations.of(context).translate("privacy_policy")),
                      onTap: () {
                        Navigator.of(context).pushNamed("privacy_policy");
                        Navigator.of(context, rootNavigator: true).pop();
                      }),
                ],
                applicationIcon: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/launcher/icon.png", height: 70),
                  ),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x54888888),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: Text(
                  AppLocalizations.of(context).translate("logout"),
                  style: TextStyle(color: TERRA_COTTA_RED),
                ),
                onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text(AppLocalizations.of(context).translate("alert_logout")),
                          actions: [
                            TextButton(
                              child: Text(AppLocalizations.of(context).translate("no").toUpperCase()),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            TextButton(
                              child: Text(AppLocalizations.of(context).translate("yes").toUpperCase()),
                              onPressed: () {
                                auth.signOut();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
