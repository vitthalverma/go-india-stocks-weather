import 'package:go_india_stocks/features/domain/entity/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.cityName,
    required super.weatherCondition,
    required super.currentTemp,
    required super.humidity,
    required super.windSpeed,
    required super.icon,
    required super.lastUpdated,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'] ?? '',
      weatherCondition: json['current']['condition']['text'] ?? '',
      currentTemp: json['current']['temp_c'] ?? 0,
      humidity: json['current']['humidity'] ?? 0,
      windSpeed: json['current']['wind_kph'] ?? 0,
      icon: json['current']['condition']['icon'] ?? '',
      lastUpdated: json['current']['last_updated'] ?? '',
    );
  }
}
