import 'package:flutter/material.dart';
import 'package:go_india_stocks/adaptive/screen_type.dart';

class SizingInfo {
  SizingInfo({
    required this.type,
    required this.screenSize,
    required this.localWidgetSize,
  });
  final ScreenType type;
  final Size screenSize;
  final Size localWidgetSize;
}
