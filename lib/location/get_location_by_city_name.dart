import 'package:geocoding/geocoding.dart';

class GetLocationByCityName {
  Future<String> getLatitude(cityname) async {
    List<Location> position = await locationFromAddress(cityname);
    return position[0].latitude.toString();
  }

  Future<String> getLongitude(cityname) async {
    List<Location> position = await locationFromAddress(cityname);
    return position[0].longitude.toString();
  }
}
