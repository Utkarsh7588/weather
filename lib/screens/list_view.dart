import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/states/states.dart';

import '../models/get_weather/datum.dart';

Widget listview(WeatherLoadedState state) {
  return ListView.builder(
    itemBuilder: (context, index) {
      Datum? data = state.weather.data?[index];
      return ListTile(
        leading: Text(data!.datetime!),
        trailing: Image.asset('assets/weather/' + data.weather!.icon! + '.png'),
        title:
            Text(data.temp.toString() + '°C    ' + data.weather!.description!),
      );
    },
    itemCount: state.weather.data!.length,
  );
}
