import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(-19.904289, -43.953066),
    zoom: 10,
  );

  static final CameraPosition _newPosition = CameraPosition(
      bearing: 250, target: LatLng(-19.846614, -43.968555), tilt: 60, zoom: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Go to Pampulha!'),
        icon: Icon(Icons.directions_boat),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _goToTheLake() async {
    final controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_newPosition));
  }
}
