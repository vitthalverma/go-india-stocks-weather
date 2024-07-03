import 'package:flutter/material.dart';
import 'package:go_india_stocks/core/app/app_provider.dart';
import 'package:go_india_stocks/core/app/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: (context) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
