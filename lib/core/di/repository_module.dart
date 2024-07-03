import 'package:go_india_stocks/core/di/client_module.dart';
import 'package:go_india_stocks/features/data/repository/weather_repo_implem.dart';
import 'package:go_india_stocks/features/domain/repository/weather_repository.dart';

mixin RepositoryModule on ClientModule {
  WeatherRepository get weatherRepository {
    return WeatherRepoImpl(apiService);
  }
}
