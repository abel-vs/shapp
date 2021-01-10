import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shapp/services/app_localizations.dart';

const CameraPosition Delft = CameraPosition(
  target: LatLng(52.00667, 4.35556),
  zoom: 10,
);

const String androidKey = 'AIzaSyCgXaBGdT_dl7zcyQ77wQ5vU1HsyCMsAIA';
const String iosKey = 'AIzaSyC91byt3oXKik2bcw26gneeiBT-o3juAQs';
const String lightMapStyle = 'assets/map_style_light';
const String darkMapStyle = 'assets/map_style_dark';

Future<LocationResult> pickLocation(BuildContext context) {
  final String apiKey = Platform.isAndroid ? androidKey : iosKey;
  final String mapStyle = Theme.of(context).brightness == Brightness.dark ? darkMapStyle : lightMapStyle;
  final BoxDecoration searchBarDecoration = BoxDecoration(
    color: Theme.of(context).cardColor,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 1,
        offset: Offset(0, 1), // changes position of shadow
      ),
    ],
  );
  final Widget resultConfirmIcon = Icon(Icons.arrow_forward, color: Theme.of(context).canvasColor);

  return showLocationPicker(
    context,
    apiKey,
    mapStylePath: mapStyle,
    initialCenter: Delft.target,
    initialZoom: Delft.zoom,
    countries: ["nl"],
    language: "nl",
    hintText: AppLocalizations.of(context).translate("search_place"),
    resultCardConfirmIcon: resultConfirmIcon,
    searchBarBoxDecoration: searchBarDecoration,
  );
}
