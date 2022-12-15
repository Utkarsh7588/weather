import 'package:geolocator/geolocator.dart';
import 'package:weather/location/loaction.dart';

class GetLocation {
  Future<double> get_position() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    return Location(position: position).getLatitude();
  }
}
