import 'dart:convert';
import 'dart:developer';

import 'package:weather/api/api_key.dart';
import 'package:weather/models/get_weather/get_weather.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  static const String _baseUrl =
      'https://api.weatherbit.io/v2.0/forecast/daily?key=$apiKey';

  Future<GetWeather> processData(lat, lon) async {
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
