import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_stocks/core/di/client_module.dart';
import 'package:go_india_stocks/core/di/repository_module.dart';
import 'package:go_india_stocks/core/di/usecase_module.dart';
import 'package:go_india_stocks/core/reponsive/responsive_util_init.dart';
import 'package:go_india_stocks/features/presentation/bloc/weather_bloc.dart';

class AppProvider extends StatefulWidget {
  const AppProvider({
    required this.child,
    super.key,
  });

  final Widget Function(BuildContext context) child;

  @override
  State<AppProvider> createState() => _AppProviderState();
}

class _AppProviderState extends State<AppProvider>
    with ClientModule, RepositoryModule, UsecaseModule {
  @override
  Widget build(BuildContext context) {
    return ResponsiveUtilInit(
      designSize: const Size(375, 812),
      builder: () => MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: weatherUseCase),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => WeatherBloc(weatherUsecase: weatherUseCase),
            ),
          ],
          child: Builder(
            builder: (context) {
              return widget.child(context);
            },
          ),
        ),
      ),
    );
  }
}
