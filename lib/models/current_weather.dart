import 'dart:convert';

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromMap(Map<String, dynamic> data) => Weather(
        id: data['id'] as int?,
        main: data['main'] as String?,
        description: data['description'] as String?,
        icon: data['icon'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Weather].
  factory Weather.fromJson(String data) {
    return Weather.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Weather] to a JSON string.
  String toJson() => json.encode(toMap());
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;

  int? humidity;

  Main({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.humidity,
  });

  factory Main.fromMap(Map<String, dynamic> data) => Main(
        temp: (data['temp'] as num?)?.toDouble(),
        tempMin: (data['temp_min'] as num?)?.toDouble(),
        tempMax: (data['temp_max'] as num?)?.toDouble(),
        humidity: data['humidity'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'temp': temp,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'humidity': humidity,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Main].
  factory Main.fromJson(String data) {
    return Main.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Main] to a JSON string.
  String toJson() => json.encode(toMap());
}
