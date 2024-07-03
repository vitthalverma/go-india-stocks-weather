import 'package:flutter/material.dart';
import 'package:go_india_stocks/core/reponsive/responsive_util.dart';

class ResponsiveUtilInit extends StatelessWidget {
  const ResponsiveUtilInit({
    required this.builder,
    this.designSize = ResponsiveUtil.defaultSize,
    super.key,
  });

  final Widget Function() builder;

  final Size designSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (_, Orientation orientation) {
            if (constraints.maxWidth != 0) {
              ResponsiveUtil.init(
                constraints,
                orientation: orientation,
                designSize: designSize,
              );
              return builder();
            }
            return Container();
          },
        );
      },
    );
  }
}
