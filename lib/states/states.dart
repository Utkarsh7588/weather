import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/models/get_weather/get_weather.dart';
import 'package:weather/states/state_notifier.dart';

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

class GetCityNameState extends WeatherState {}

class ErrorWeatherState extends WeatherState {
  ErrorWeatherState({required this.message});
  final String message;
}
