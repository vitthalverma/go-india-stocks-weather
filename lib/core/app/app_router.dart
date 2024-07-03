import 'package:flutter/material.dart';
import 'package:go_india_stocks/features/presentation/view/home_screen.dart';
import 'package:go_india_stocks/features/presentation/view/weather_screen.dart';

const weatherRoute = '/weather';

class AppRouter {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case weatherRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return const WeatherScreen();
          },
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return const HomeScreen();
          },
        );
    }
  }
}
