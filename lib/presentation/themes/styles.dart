import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "package:nasa_apod/presentation/themes/palette.dart";

class Styles {
  final Palette palette;

  Styles({required this.palette});

  TextStyle get appBarTextStyle => TextStyle(
    fontFamily: "Inter",
    fontSize: 18.sp,
    height: 1,
    fontWeight: FontWeight.w500,
    color: palette.text,
  );

  TextStyle get buttonTextStyle => TextStyle(
    fontFamily: "Inter",
    fontSize: 20.sp,
    height: 1,
    fontWeight: FontWeight.w500,
    color: palette.text,
  );

  ButtonStyle get iconButtonBorder => FilledButton.styleFrom(
    backgroundColor: palette.bloc,
    padding: EdgeInsets.all(18.r),
    shape: RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(18.r)),
    ),
  );

  ButtonStyle get textButtonBorder => FilledButton.styleFrom(
    backgroundColor: palette.bloc,
    padding: EdgeInsets.all(20.r),
    shape: RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(18.r)),
    ),
  );
}
