
import 'package:shapp/services/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  GoogleMapController mapController;
  Location location = new Location();

  // ignore: non_constant_identifier_names
  static final CameraPosition Delft = CameraPosition(
    target: LatLng(52.00667, 4.35556),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).translate("map")),),
      body: GoogleMap(
        zoomControlsEnabled: false,
        initialCameraPosition: Delft,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        onMapCreated: _onMapCreated,
      ),
      floatingActionButton: FloatingActionButton(
//        foregroundColor: Colors.white,
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
        CameraPosition(target: LatLng(pos.latitude, pos.longitude), zoom: 17.0),
      ),
    );
  }
}
