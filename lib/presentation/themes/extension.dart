import 'package:flutter/material.dart';

import 'package:nasa_apod/presentation/themes/palette.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  CustomTheme({required this.palette});

  final Palette palette;

  @override
  ThemeExtension<CustomTheme> copyWith() {
    return CustomTheme(palette: palette);
  }

  @override
  ThemeExtension<CustomTheme> lerp(covariant ThemeExtension<ThemeExtension>? other, double t) {
    return this;
  }

  static CustomTheme of(BuildContext context) {
    return Theme.of(context).extension<CustomTheme>()!;
  }
}
