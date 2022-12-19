import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/states/states.dart';

class ErrorScreen extends ConsumerWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WeatherState state = ref.watch(weatherProvider);
    if (state is ErrorWeatherState) {
      return WillPopScope(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.message),
              TextButton(
                onPressed: () {
                  ref.read(weatherProvider.notifier).setStateInitialState();
                },
                child: Text('OK'),
              )
            ],
          ),
        ),
        onWillPop: () async {
          ref.read(weatherProvider.notifier).setStateInitialState();
          return false;
        },
      );
    } else {
      ref.read(weatherProvider.notifier).setStateInitialState();
      return const Text('');
    }
  }
}
