part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherDone extends WeatherState {
  final WeatherEntity weather;

  const WeatherDone({required this.weather});
  @override
  List<Object> get props => [weather];
}

final class WeatherLoadingError extends WeatherState {
  final DioException error;

  const WeatherLoadingError({required this.error});
  @override
  List<Object> get props => [error];
}
