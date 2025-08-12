import "package:flutter/material.dart";

import "package:nasa_apod/presentation/themes/palette.dart";
import "package:nasa_apod/presentation/themes/styles.dart";

class CustomTheme extends ThemeExtension<CustomTheme> {
  final Palette palette;
  final Styles styles;

  CustomTheme({required this.palette}) : styles = Styles(palette: palette);

  @override
  ThemeExtension<CustomTheme> copyWith() {
    return CustomTheme(palette: palette);
  }

  @override
  ThemeExtension<CustomTheme> lerp(
    covariant ThemeExtension<ThemeExtension>? other,
    double t,
  ) {
    return this;
  }

  static CustomTheme of(BuildContext context) {
    return Theme.of(context).extension<CustomTheme>()!;
  }
}
