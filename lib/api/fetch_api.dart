import 'dart:convert';
import 'dart:developer';

import 'package:weather/api/api_key.dart';
import 'package:weather/location/get_location.dart';
import 'package:weather/models/get_weather/get_weather.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  static const String _baseUrl =
      'https://api.weatherbit.io/v2.0/forecast/daily?key=$apiKey';

  Future<GetWeather> processData() async {
    String lat = await GetLocation().getLatitude();
    String lon = await GetLocation().getLongitude();

    String endpoint = '&lat=$lat&lon=$lon';

    try {
      Uri weatherUri = Uri.parse('$_baseUrl$endpoint');
      http.Response response = await http.get(weatherUri);
      var jsonString = jsonDecode(response.body);
      GetWeather weatherData = GetWeather.fromJson(jsonString);
      return weatherData;
    } catch (e) {
      rethrow;
    }
  }
}
