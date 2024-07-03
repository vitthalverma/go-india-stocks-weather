import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_india_stocks/core/app/app_colors.dart';
import 'package:go_india_stocks/core/reponsive/responsive_extension.dart';

enum SnackType { error, success, info }

class AppSnack {
  static void error(
    BuildContext context,
    String message, [
    DesktopSnackBarPosition? position,
  ]) {
    AnimatedSnackBar(
      mobilePositionSettings: const MobilePositionSettings(
        topOnAppearance: 60,
        bottomOnAppearance: 60,
      ),
      desktopSnackBarPosition: position ?? DesktopSnackBarPosition.topCenter,
      duration: const Duration(seconds: 3),
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.red.shade700,
            borderRadius: BorderRadius.circular(3.w),
          ),
          child: ListTile(
            minLeadingWidth: 8.w,
            leading: const Icon(
              Icons.error,
              color: white,
            ),
            title: Text(message, style: const TextStyle(color: white)),
          ),
        );
      },
    ).show(context);
  }

  static void success(
    BuildContext context,
    String message, [
    DesktopSnackBarPosition? position,
  ]) {
    AnimatedSnackBar(
      mobilePositionSettings: const MobilePositionSettings(
        topOnAppearance: 60,
      ),
      desktopSnackBarPosition: position ?? DesktopSnackBarPosition.topCenter,
      duration: const Duration(seconds: 3),
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.green.shade400,
            borderRadius: BorderRadius.circular(3.w),
          ),
          child: ListTile(
            minLeadingWidth: 8.w,
            leading: const Icon(
              Icons.done,
              color: white,
            ),
            title: Text(message, style: const TextStyle(color: white)),
          ),
        );
      },
    ).show(context);
  }

  static void info(
    BuildContext context,
    String message, [
    DesktopSnackBarPosition? position,
  ]) {
    AnimatedSnackBar(
      mobilePositionSettings: const MobilePositionSettings(
        topOnAppearance: 60,
      ),
      desktopSnackBarPosition: position ?? DesktopSnackBarPosition.topCenter,
      duration: const Duration(seconds: 6),
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(3.w),
          ),
          child: ListTile(
            minLeadingWidth: 8.w,
            leading: const Icon(
              Icons.info,
              color: white,
            ),
            title: Text(message, style: const TextStyle(color: white)),
          ),
        );
      },
    ).show(context);
  }
}
