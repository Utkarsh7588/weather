import 'package:geolocator/geolocator.dart';
import 'package:weather/location/loaction.dart';

class GetLocation {
  Future<String> getLatitude() async {
    Position pos = await Location().location();
    return pos.latitude.toString();
  }

  Future<String> getLongitude() async {
    Position pos = await Location().location();
    return pos.longitude.toString();
  }
}
