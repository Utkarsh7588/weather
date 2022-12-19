import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/location/get_location_by_city_name.dart';

import '../states/states.dart';

class SearchScreen extends ConsumerWidget {
  SearchScreen({Key? key}) : super(key: key);
  final TextEditingController _city = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _city,
              enableSuggestions: true,
              autocorrect: false,
              keyboardType: TextInputType.streetAddress,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: 'City Name'),
            ),
            TextButton(
              onPressed: () async {
                String city = _city.text;

                ref.read(weatherProvider.notifier).fetchweatherByCityName(city);
              },
              child: const Text('Get Weather'),
            )
          ],
        ),
      ),
      onWillPop: () async {
        ref.read(weatherProvider.notifier).setStateInitialState();
        return false;
      },
    );
  }
}
