import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

import "package:nasa_apod/presentation/themes/extension.dart";

void showLoading() {
  BuildContext context = Get.context as BuildContext;
  CustomTheme theme = CustomTheme.of(context);
  Get.dialog(
    PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        shape: BoxBorder.fromBorderSide(BorderSide.none),
        child: Center(
          child: SizedBox.square(
            dimension: 48.r,
            child: CircularProgressIndicator(
              backgroundColor: theme.palette.shadow,
              color: theme.palette.icon,
            ),
          ),
        ),
      ),
    ),
  );
}

void showMessage({required String title, required String? text}) {
  BuildContext context = Get.context as BuildContext;
  CustomTheme theme = CustomTheme.of(context);
  Get.dialog(
    AlertDialog(
      backgroundColor: theme.palette.bloc,
      shape: theme.styles.defaultShapeBorder,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: theme.styles.alertTitleTextStyle,
      ),
      titlePadding: EdgeInsets.all(24.r),
      content: (text != null)
          ? Text(
              text,
              textAlign: TextAlign.center,
              style: theme.styles.alertContentTextStyle,
            )
          : null,
      contentPadding: EdgeInsets.only(right: 24.r, bottom: 24.r, left: 24.r),
    ),
  );
}
