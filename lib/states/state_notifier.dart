import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/api/fetch_api.dart';
import 'package:weather/location/get_location.dart';
import 'package:weather/models/get_weather/get_weather.dart';

import 'package:weather/states/states.dart';

import '../location/get_location_by_city_name.dart';

class WeatherNotifier extends StateNotifier<WeatherState> {
  WeatherNotifier() : super(InitialState());
  final FetchWeatherAPI _fetchWeatherAPI = FetchWeatherAPI();

  fetchweather(lat, lon) async {
    try {
      GetWeather weather = await _fetchWeatherAPI.processData(lat, lon);
      state = WeatherLoadedState(weather: weather);
    } catch (e) {
      state = ErrorWeatherState(message: e.toString());
    }
  }

  fetchweatherByCityName(city) async {
    try {
      state = WeatherLoadingState();
      String lat = await GetLocationByCityName().getLatitude(city);
      String lon = await GetLocationByCityName().getLongitude(city);
      await fetchweather(lat, lon);
    } catch (e) {
      state = ErrorWeatherState(message: e.toString());
    }
  }

  fetchweatherByLocation() async {
    try {
      state = WeatherLoadingState();
      String lat = await GetLocation().getLatitude();
      String lon = await GetLocation().getLongitude();
      await fetchweather(lat, lon);
    } catch (e) {
      state = ErrorWeatherState(message: e.toString());
    }
  }

  setStateInitialState() {
    state = InitialState();
  }

  setStateGetCityName() {
    state = GetCityNameState();
  }
}
