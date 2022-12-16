import 'datum.dart';

class GetWeather {
  String? cityName;
  String? countryCode;
  List<Datum>? data;
  double? lat;
  double? lon;
  String? stateCode;
  String? timezone;

  GetWeather({
    this.cityName,
    this.countryCode,
    this.data,
    this.lat,
    this.lon,
    this.stateCode,
    this.timezone,
  });

  factory GetWeather.fromJson(Map<String, dynamic> json) => GetWeather(
        cityName: json['city_name'] as String?,
        countryCode: json['country_code'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        lat: json['lat'] as double?,
        lon: json['lon'] as double?,
        stateCode: json['state_code'] as String?,
        timezone: json['timezone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'city_name': cityName,
        'country_code': countryCode,
        'data': data?.map((e) => e.toJson()).toList(),
        'lat': lat,
        'lon': lon,
        'state_code': stateCode,
        'timezone': timezone,
      };
}
