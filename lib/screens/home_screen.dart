import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/states/states.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          const Text(
            'Hello the UI not great but I dont have time and also I just wanted the satisfation of finfishing this Project',
            textAlign: TextAlign.center,
          ),
          const Text(
            'So You can get weather by ',
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              ref.read(weatherProvider.notifier).fetchweatherByLocation();
            },
            child: const Text('Current location'),
          ),
          TextButton(
            onPressed: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => SearchScreen()));
              ref.read(weatherProvider.notifier).setStateGetCityName();
            },
            child: const Text('Search for Location'),
          ),
        ],
      ),
    );
  }
}
