import 'package:flutter/material.dart';
import 'package:go_india_stocks/core/adaptive/screen_type.dart';
import 'package:go_india_stocks/core/adaptive/sizing_info.dart';

class AdaptiveBuilder extends StatelessWidget {
  const AdaptiveBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(
    BuildContext context,
    SizingInfo sizingInfo,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxContraints) {
        final mediaQuery = MediaQuery.of(context);
        final size = mediaQuery.size;
        final shortestSize = mediaQuery.size.shortestSide;
        final sizingInfo = SizingInfo(
          type: getScreenType(shortestSize),
          screenSize: size,
          localWidgetSize:
              Size(boxContraints.maxWidth, boxContraints.maxHeight),
        );
        return builder(context, sizingInfo);
      },
    );
  }
}
