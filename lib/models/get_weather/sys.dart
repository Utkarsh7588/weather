import 'dart:convert';

class Sys {
	String? country;
	int? sunrise;
	int? sunset;

	Sys({this.country, this.sunrise, this.sunset});

	factory Sys.fromMap(Map<String, dynamic> data) => Sys(
				country: data['country'] as String?,
				sunrise: data['sunrise'] as int?,
				sunset: data['sunset'] as int?,
			);

	Map<String, dynamic> toMap() => {
				'country': country,
				'sunrise': sunrise,
				'sunset': sunset,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Sys].
	factory Sys.fromJson(String data) {
		return Sys.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Sys] to a JSON string.
	String toJson() => json.encode(toMap());
}
