import 'package:Shapp/services/app_localizations.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("favorites")),
      ),
    );
  }
}
