part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

final class GetWeatherReport extends WeatherEvent {
  final String city;

  const GetWeatherReport({required this.city});
  @override
  List<Object> get props => [city];
}

final class WeatherReset extends WeatherEvent {}
