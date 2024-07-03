import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_india_stocks/core/resourses/data_state.dart';
import 'package:go_india_stocks/features/domain/entity/weather_entity.dart';
import 'package:go_india_stocks/features/domain/usecases/weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUsecase weatherUsecase;
  WeatherBloc({required this.weatherUsecase}) : super(WeatherInitial()) {
    on<GetWeatherReport>((event, emit) async {
      emit(WeatherLoading());
      final dataState = await weatherUsecase.call(event.city);

      if (dataState is DataSuccess) {
        emit(WeatherDone(weather: dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(WeatherLoadingError(error: dataState.error!));
      }
    });

    on<WeatherReset>(
      (event, emit) {
        emit(WeatherInitial());
      },
    );
  }
}
