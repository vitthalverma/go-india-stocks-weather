import 'package:go_india_stocks/core/resourses/data_state.dart';
import 'package:go_india_stocks/features/domain/entity/weather_entity.dart';

abstract class WeatherRepository {
  Future<DataState<WeatherEntity>> getWeatherReport(String input);
}
