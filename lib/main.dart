import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_india_stocks/bootstrap.dart';
import 'package:go_india_stocks/core/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(bootstrap(() => const App()));
}
