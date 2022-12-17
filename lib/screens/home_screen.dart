import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/location/get_location.dart';
import 'package:weather/states/states.dart';

import '../location/loaction.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            WeatherState state = ref.watch(weatherProvider);
            if (state is InitialState) {
              return Text('initial State');
            }
            if (state is WeatherLoadingState) {
              return Text('loading...');
            }
            if (state is WeatherLoadedState) {
              double? temp = state.weather.data?[0].temp;
              return Text(temp.toString());
            }
            if (state is ErrorWeatherState) {
              return Text(state.message);
            } else {
              return Text('something');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(weatherProvider.notifier).fetchweather();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
