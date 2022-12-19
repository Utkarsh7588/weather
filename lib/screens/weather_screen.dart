import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/screens/list_view.dart';
import 'package:weather/states/states.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WeatherState state = ref.watch(weatherProvider);
    if (state is WeatherLoadedState) {
      String? image = state.weather.data?[0].weather?.icon;
      String? description = state.weather.data?[0].weather?.description;
      String? temp = state.weather.data?[0].temp.toString();
      String? mintemp = state.weather.data?[0].minTemp.toString();
      String? maxtemp = state.weather.data?[0].maxTemp.toString();
      String? city_name = state.weather.cityName.toString();
      return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Weather'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(city_name,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(fontSize: 20),
                  )),
              Row(
                children: [
                  Image(
                    image: AssetImage('assets/weather/' + image! + '.png'),
                  ),
                  Text(
                    description!,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 170, 0),
                child: Text(
                  temp! + '°C',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 190, 0),
                child: Text('min:' + mintemp! + '°C'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 190, 0),
                child: Text('max:' + maxtemp! + '°C'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 500,
                  child: listview(state),
                ),
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
