import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";

import "package:nasa_apod/presentation/themes/extension.dart";

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const CustomAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomTheme.of(context);
    return Container(
      width: preferredSize.width,
      height: preferredSize.height + View.of(context).padding.top,
      alignment: Alignment.bottomCenter,
      color: theme.palette.bloc,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          spacing: 4.w,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/nasa_logo.svg",
              width: 50.w,
              height: 42.h,
            ),
            Text(text, style: theme.styles.appBarTextStyle),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(1.sw, 58.h);
}
