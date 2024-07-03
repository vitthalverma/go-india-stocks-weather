import 'package:dio/dio.dart';
import 'package:go_india_stocks/features/data/api/weather_api_service.dart';

mixin ClientModule {
  WeatherApiService get apiService {
    return WeatherApiService(Dio(
      BaseOptions(contentType: 'application/json'),
    ));
  }
}
