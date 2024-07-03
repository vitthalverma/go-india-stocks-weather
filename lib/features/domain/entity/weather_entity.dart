import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String cityName;
  final String weatherCondition;
  final double currentTemp;
  final int humidity;
  final double windSpeed;
  final String icon;
  final String lastUpdated;

  WeatherEntity({
    required this.cityName,
    required this.weatherCondition,
    required this.currentTemp,
    required this.humidity,
    required this.windSpeed,
    required this.icon,
    required this.lastUpdated,
  });

  @override
  List<Object?> get props => [
        cityName,
        weatherCondition,
        currentTemp,
        humidity,
        windSpeed,
        icon,
        lastUpdated,
      ];
}
