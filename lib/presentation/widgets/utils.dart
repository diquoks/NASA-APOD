import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:nasa_apod/presentation/themes/extension.dart';

void showLoading() {
  BuildContext context = Get.context as BuildContext;
  CustomTheme theme = CustomTheme.of(context);
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      shape: BoxBorder.fromBorderSide(BorderSide.none),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          color: theme.palette.icon,
        ),
      ),
    ),
  );
}

void showError(String e) {
  BuildContext context = Get.context as BuildContext;
  CustomTheme theme = CustomTheme.of(context);
  Get.dialog(
    AlertDialog(
      backgroundColor: theme.palette.bloc,
      shape: theme.styles.defaultShapeBorder,
      content: Text(
        e,
        textAlign: TextAlign.center,
        style: theme.styles.alertTextStyle,
      ),
      contentPadding: EdgeInsets.all(24.r),
    ),
  );
}
