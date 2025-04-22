import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineScreen extends StatefulWidget {
  const PolylineScreen({super.key});

  @override
  State<PolylineScreen> createState() => _PolylineScreenState();
}

class _PolylineScreenState extends State<PolylineScreen> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.738045, 73.084488),
    zoom: 14,
  );

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  List<LatLng> latlng = [
    LatLng(33.738045, 73.084488),
    LatLng(33.567997728, 72.635997456),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < latlng.length; i++) {
      _markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: latlng[i],
          infoWindow: InfoWindow(
            title: 'Really cool place',
            snippet: '5 Star Rating',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }

    setState(() {});

    _polyline.add(
      Polyline(
        polylineId: PolylineId('1'),
        points: latlng,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polyline'),
      ), // AppBar
      body: GoogleMap(
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        polylines: _polyline,
        myLocationEnabled: true,
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
      ), // GoogleMap, Scaffold
    );
  }
}
