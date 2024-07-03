import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_stocks/core/app/app_colors.dart';
import 'package:go_india_stocks/core/reponsive/responsive_extension.dart';
import 'package:go_india_stocks/core/resourses/preferences_helper.dart';
import 'package:go_india_stocks/core/utils/app_snackbar.dart';
import 'package:go_india_stocks/features/presentation/bloc/weather_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadLastSearchedCity();
  }

  Future<void> _loadLastSearchedCity() async {
    final lastCity = await PreferencesHelper.getLastSearchedCity();
    if (lastCity != null) {
      cityController.text = lastCity;
    }
  }

  Future<void> _saveCityAndFetchWeather() async {
    final city = cityController.text;
    await PreferencesHelper.saveLastSearchedCity(city);
    context.read<WeatherBloc>().add(GetWeatherReport(city: city));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather Report',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        body: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherDone) {
              AppSnack.success(context, 'Weather fetched successfully');
              Navigator.pushNamed(context, '/weather',
                  arguments: state.weather);
            }
            if (state is WeatherLoadingError) {
              if (state.error.type == DioExceptionType.badResponse) {
                AppSnack.error(context, 'Enter valid city');
              }
            }
          },
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoadingError) {
              return Center(
                  child: IconButton(
                onPressed: () {
                  cityController.clear();
                  context.read<WeatherBloc>().add(WeatherReset());
                },
                icon: const Icon(Icons.refresh),
              ));
            } else {
              return Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: cityController,
                      decoration: const InputDecoration(
                        hintText: 'Enter city name',
                        labelText: 'City',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: _saveCityAndFetchWeather,
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: black,
                        ),
                        child: const Center(
                            child: Text(
                          'Get Weather Report',
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
