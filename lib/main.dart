import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/screens/error_screen.dart';
import 'package:weather/screens/home_screen.dart';
import 'package:weather/screens/search_screen.dart';
import 'package:weather/screens/weather_screen.dart';
import 'package:weather/states/states.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Starter(),
    );
  }
}

class Starter extends ConsumerWidget {
  const Starter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            WeatherState state = ref.watch(weatherProvider);
            if (state is InitialState) {
              return const HomeScreen();
            }
            if (state is WeatherLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is GetCityNameState) {
              return SearchScreen();
            }
            if (state is WeatherLoadedState) {
              // double? temp = state.weather.data?[0].temp;
              // return Text(temp.toString() + '°C');
              return const WeatherScreen();
            }
            if (state is ErrorWeatherState) {
              return const ErrorScreen();
            } else {
              return const Text('some Error');
            }
          },
        ),
      ),
    );
  }
}
