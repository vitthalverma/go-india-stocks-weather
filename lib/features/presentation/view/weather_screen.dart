import 'package:flutter/material.dart';
import 'package:go_india_stocks/core/app/app_colors.dart';
import 'package:go_india_stocks/core/reponsive/responsive_extension.dart';
import 'package:go_india_stocks/features/data/model/weather_model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    final weather = ModalRoute.of(context)!.settings.arguments as WeatherModel;
    final imageUrl = 'https:${weather.icon}';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          weather.cityName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            Text(
              'Last updated: ${weather.lastUpdated}',
              style: const TextStyle(color: black),
            ),
            SizedBox(height: 60.h),
            Center(
              child: SizedBox(
                height: 180.h,
                width: 180.h,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              weather.weatherCondition,
              style: TextStyle(fontSize: 15.sp),
            ),
            SizedBox(height: 10.h),
            Text(
              '${weather.currentTemp} °C',
              style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 70.h),
            Row(
              children: [
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: SizedBox(
                    height: 120.h,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/humidity.png',
                            height: 50.h,
                            width: 50.h,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            '${weather.humidity}%',
                            style: TextStyle(
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(10.h),
                    child: SizedBox(
                      height: 120.h,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.air_rounded,
                              size: 60.sp,
                              color: Colors.blue.shade300,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              '${weather.windSpeed} kph',
                              style: TextStyle(
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
