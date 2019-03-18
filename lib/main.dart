import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
          body: FireMap(),
          appBar: AppBar(
            title: Text('SHOW mAP'),
          ),
        ));
  }
}

class FireMap extends StatefulWidget {
  @override
  State createState() => FireMapState();
}

class FireMapState extends State<FireMap> {
  GoogleMapController mapController;

  build(context) {
    return Stack(children: [
      GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(23.558149, 120.472019), zoom: 15),
          onMapCreated: _onMapCreated,
          myLocationEnabled:
              true, // Add little blue dot for device location, requires permission from user
          mapType: MapType.normal,
          trackCameraPosition: true),
      Positioned(
        bottom: 16,
        right: 16,
        child: FloatingActionButton(
          onPressed: _addMarker,
          tooltip: 'Set Marker',
          child: Icon(Icons.add_location), //Icon(Icons.pin_drop)
        ),
      )
    ]);
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  _addMarker() {
    var marker = MarkerOptions(
        position: mapController.cameraPosition.target,
        icon: BitmapDescriptor.defaultMarker,
        infoWindowText: InfoWindowText('Magic Marker', '🍄🍄🍄'));

    mapController.addMarker(marker);
  }
}
