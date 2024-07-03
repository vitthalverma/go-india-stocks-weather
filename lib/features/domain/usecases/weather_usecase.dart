import 'package:go_india_stocks/core/resourses/data_state.dart';
import 'package:go_india_stocks/core/usecases/core_usecases.dart';
import 'package:go_india_stocks/features/domain/entity/weather_entity.dart';
import 'package:go_india_stocks/features/domain/repository/weather_repository.dart';

class WeatherUsecase extends CoreUsecase<DataState<WeatherEntity>, String> {
  final WeatherRepository _weatherRepository;

  WeatherUsecase(this._weatherRepository);

  @override
  Future<DataState<WeatherEntity>> call(String input) {
    return _weatherRepository.getWeatherReport(input);
  }
}
