enum ScreenType { desktop, tablet, mobile }

ScreenType getScreenType(double size) {
  if (size > 990) {
    return ScreenType.desktop;
  } else if (size <= 990 && size >= 672) {
    return ScreenType.tablet;
  } else {
    return ScreenType.mobile;
  }
}
