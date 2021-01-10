import 'package:flutter/material.dart';
import 'package:shapp/services/app_localizations.dart';

String emptyValidator(value, String text) {
  if (value.isEmpty) {
    return text;
  }
  return null;
}

String locationValidator(BuildContext context, String value){
  if(value.isEmpty){
    return AppLocalizations.of(context).translate("location_required");
  }
  if(!value.contains("Delft")){
    return AppLocalizations.of(context).translate("location_must_delft");
  }
  return null;
}
