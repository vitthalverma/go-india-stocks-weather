import 'dart:io';

import 'package:dio/dio.dart';
import 'package:go_india_stocks/core/resourses/data_state.dart';
import 'package:go_india_stocks/features/data/api/weather_api_service.dart';
import 'package:go_india_stocks/features/data/model/weather_model.dart';
import 'package:go_india_stocks/features/domain/repository/weather_repository.dart';

class WeatherRepoImpl extends WeatherRepository {
  final WeatherApiService apiService;
  // final String q;

  WeatherRepoImpl(this.apiService);

  @override
  Future<DataState<WeatherModel>> getWeatherReport(String city) async {
    try {
      final httpResp = await apiService.getWeatherReport(
        key: '0497e2b4c5e34eb3b3b41535240207',
        q: city,
      );
      if (httpResp.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResp.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResp.response.statusMessage,
            response: httpResp.response,
            requestOptions: httpResp.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
