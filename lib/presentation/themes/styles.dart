import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "package:nasa_apod/presentation/themes/palette.dart";

class Styles {
  final Palette palette;

  Styles({required this.palette});

  TextStyle get alertContentTextStyle => TextStyle(
    fontFamily: "Inter",
    fontSize: 16.r,
    height: 1.5,
    fontWeight: FontWeight.w400,
    color: palette.text,
  );

  TextStyle get alertTitleTextStyle => TextStyle(
    fontFamily: "Inter",
    fontSize: 20.r,
    height: 1.5,
    fontWeight: FontWeight.w600,
    color: palette.text,
  );

  TextStyle get appBarTextStyle => TextStyle(
    fontFamily: "Inter",
    fontSize: 18.r,
    height: 1,
    fontWeight: FontWeight.w500,
    color: palette.text,
  );

  TextStyle get buttonTextStyle => TextStyle(
    fontFamily: "Inter",
    fontSize: 20.r,
    height: 1,
    fontWeight: FontWeight.w500,
    color: palette.text,
  );

  ButtonStyle get iconButtonBorder => FilledButton.styleFrom(
    backgroundColor: palette.bloc,
    padding: EdgeInsets.all(18.r),
    shape: defaultShapeBorder,
  );

  ButtonStyle get textButtonBorder => FilledButton.styleFrom(
    backgroundColor: palette.bloc,
    padding: EdgeInsets.all(20.r),
    shape: defaultShapeBorder,
  );

  OutlinedBorder get defaultShapeBorder => RoundedRectangleBorder(
    side: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(18.r)),
  );
}
