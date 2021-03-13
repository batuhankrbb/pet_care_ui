import 'package:flutter/material.dart';

extension ResponsiveDesign on BuildContext {
  double dynamicHeight(double rate) {
    if (rate < 0) {
      return 0.0;
    }
    return MediaQuery.of(this).size.height * rate;
  }

  double dynamicWidth(double rate) {
    if (rate < 0) {
      return 0.0;
    }
    return MediaQuery.of(this).size.width * rate;
  }

  ThemeData theme() => Theme.of(this);
}
