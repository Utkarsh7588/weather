import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/api/fetch_api.dart';
import 'package:weather/models/get_weather/datum.dart';
import 'package:weather/models/get_weather/get_weather.dart';

final weatherProvider = StateNotifierProvider<WeatherNotifier, WeatherState>(
    (ref) => WeatherNotifier());

@immutable
abstract class WeatherState {}

class InitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState({required this.weather});
  final GetWeather weather;
}

class ErrorWeatherState extends WeatherState {
  ErrorWeatherState({required this.message});
  final String message;
}

class WeatherNotifier extends StateNotifier<WeatherState> {
  WeatherNotifier() : super(InitialState());
  final FetchWeatherAPI _fetchWeatherAPI = FetchWeatherAPI();
  fetchweather() async {
    try {
      state = WeatherLoadingState();
      GetWeather weather = await _fetchWeatherAPI.processData();
      state = WeatherLoadedState(weather: weather);
    } catch (e) {
      String message = e.toString();
      state = ErrorWeatherState(message: message);
    }
  }
}
