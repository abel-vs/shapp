import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shapp/services/app_localizations.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  GoogleMapController mapController;
  Location location = new Location();
  String _mapStyle;
  String lightStyle;
  String darkStyle;

  // ignore: non_constant_identifier_names
  static final CameraPosition Delft = CameraPosition(
    target: LatLng(52.00667, 4.35556),
    zoom: 10,
  );

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style_light').then((string) {
      lightStyle = string;
    });

    rootBundle.loadString('assets/map_style_dark').then((string) {
      darkStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    _mapStyle = Theme.of(context).brightness == Brightness.dark ? darkStyle : lightStyle;
    setState(() {
      if (_mapStyle != null) {
        mapController.setMapStyle(_mapStyle);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("map")),
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        initialCameraPosition: Delft,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        onMapCreated: _onMapCreated,
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Theme.of(context).cardColor,
        onPressed: _animateToUser,
        child: Icon(Icons.gps_fixed),
      ),
    );
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      _animateToUser();
    });
  }

  _animateToUser() async {
    var pos = await location.getLocation();
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(pos.latitude, pos.longitude), zoom: 15.0),
      ),
    );
  }
}
