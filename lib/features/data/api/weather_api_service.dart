import 'package:dio/dio.dart';
import 'package:go_india_stocks/features/data/model/weather_model.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_api_service.g.dart';

class Apis {
  static const baseurl = 'http://api.weatherapi.com/v1';
}

@RestApi(baseUrl: Apis.baseurl)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio) = _WeatherApiService;

  @GET('/current.json')
  Future<HttpResponse<WeatherModel>> getWeatherReport({
    @Query('key') String? key,
    @Query('q') String? q,
  });
}
