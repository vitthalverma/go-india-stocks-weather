import 'package:flutter/material.dart';
import 'package:go_india_stocks/core/app/app_colors.dart';
import 'package:go_india_stocks/features/data/model/weather_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        padding: EdgeInsets.all(3.w),
        child: Column(
          children: [
            Text(
              'Last updated: ${weather.lastUpdated}',
              style: const TextStyle(color: black),
            ),
            SizedBox(height: 7.h),
            Center(
              child: SizedBox(
                height: 20.h,
                width: 20.h,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              weather.weatherCondition,
              style: TextStyle(fontSize: 17.sp),
            ),
            SizedBox(height: 3.h),
            Text(
              '${weather.currentTemp} °C',
              style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6.h),
            Row(
              children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 17.h,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/humidity.png',
                            height: 6.h,
                            width: 6.h,
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            '${weather.humidity}%',
                            style: TextStyle(
                              fontSize: 17.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(2.w),
                    child: SizedBox(
                      height: 17.h,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.air_rounded,
                              size: 30.sp,
                              color: Colors.blue.shade300,
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              '${weather.windSpeed} kph',
                              style: TextStyle(
                                fontSize: 17.sp,
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
            SizedBox(height: 2.h),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.refresh_rounded,
                size: 22.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
