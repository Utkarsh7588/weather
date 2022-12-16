import 'package:geolocator/geolocator.dart';
import 'package:weather/location/location_exceptions.dart';

class Location {
  Future<Position> location() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationServicesDisabledException();
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationPermissionDeniedException();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionPermanentlyDeniedException();
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
  }
}
