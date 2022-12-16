class Weather {
  String? description;
  int? code;
  String? icon;

  Weather({this.description, this.code, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        description: json['description'] as String?,
        code: json['code'] as int?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'code': code,
        'icon': icon,
      };
}
