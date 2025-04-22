import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatlngIntoAddress extends StatefulWidget {
  const ConvertLatlngIntoAddress({super.key});

  @override
  State<ConvertLatlngIntoAddress> createState() =>
      _ConvertLatlngIntoAddressState();
}

class _ConvertLatlngIntoAddressState extends State<ConvertLatlngIntoAddress> {
  String _address = 'Press button to get address';
  String setAddress = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(setAddress, textAlign: TextAlign.center),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_address, textAlign: TextAlign.center),
          ),
          GestureDetector(
            onTap: () async {
              try {
                List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
                List<Placemark> placemarks = await placemarkFromCoordinates(
                  33.6992,
                  72.9744,
                );
                if (placemarks.isNotEmpty) {
                  Placemark place = placemarks[0];
                  setState(() {
                    setAddress = "${locations.last.longitude} ${locations.last.longitude}";
                    _address = '${place.street}, ${place.subLocality}, '
                        '${place.locality}, ${place.postalCode}, '
                        '${place.country}';
                  });
                }
              } catch (e) {
                setState(() {
                  _address = 'Error getting address: $e';
                });
                print('ex: $_address');
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Convert',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
