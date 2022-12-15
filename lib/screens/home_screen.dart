import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/location/get_location.dart';

import '../location/loaction.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  String? latitude;
  String? longitude;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Center(
        child: Column(children: [
          TextButton(
              onPressed: () async {
                // Position position = await Geolocator.getCurrentPosition();
                // latitude = position.latitude.toString();
                // longitude = position.longitude.toString();
                print(GetLocation().get_position().toString());
              },
              child: Text('press here')),
        ]),
      ),
    );
  }
}
