import 'package:go_india_stocks/core/di/repository_module.dart';
import 'package:go_india_stocks/features/domain/usecases/weather_usecase.dart';

mixin UsecaseModule on RepositoryModule {
  WeatherUsecase get weatherUseCase => WeatherUsecase(weatherRepository);
}
