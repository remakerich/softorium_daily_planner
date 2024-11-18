import 'dart:math';

import 'package:softorium_daily_planner/core/core.dart';

class AppColors {
  static const primary = Color(0xffBEB7EB);
  static const secondary = Color(0xffEDEBF9);
  static const tertiary = Color(0xffAFABC6);
  static const currentDay = Color(0xffD9D9D9);
  static const taskDone = Color(0xffD9D9D9);
  static const shadow = Color(0xff260347);
  static const navBarItem = Color(0xffF4F4F5);
  static const gradientStart = Color(0xffC8C7F9);
  static const gradientEnd = Color(0xffFCC8C5);

  static final backgroundGradient = LinearGradient(
    colors: [
      AppColors.gradientStart,
      AppColors.gradientEnd,
    ],
    begin: Alignment(-1.0, -1),
    end: Alignment(-1.0, 1),
    transform: GradientRotation(-1 * pi / 3),
  );
}
