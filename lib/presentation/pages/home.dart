import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "package:nasa_apod/presentation/themes/extension.dart";
import "package:nasa_apod/presentation/widgets/custom_app_bar.dart";
import "package:nasa_apod/presentation/widgets/custom_icon_button.dart";
import "package:nasa_apod/presentation/widgets/custom_text_button.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomTheme.of(context);
    return Scaffold(
      appBar: CustomAppBar(text: "Astronomy Picture of the Day"),
      backgroundColor: theme.palette.background,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          InteractiveViewer(
            clipBehavior: Clip.none,
            child: Image.asset("assets/images/test_apod.png"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 48.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox.square(
                        dimension: 60.r,
                        child: CustomIconButton(
                          onPressed: () {},
                          icon: Icons.info,
                        ),
                      ),
                      SizedBox.square(
                        dimension: 60.r,
                        child: CustomIconButton(
                          onPressed: () {},
                          icon: Icons.settings,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300.w,
                  height: 60.r,
                  child: Row(
                    spacing: 16.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomTextButton(
                          onPressed: () {},
                          text: "Get APOD",
                        ),
                      ),
                      SizedBox.square(
                        dimension: 60.r,
                        child: CustomIconButton(
                          onPressed: () {},
                          icon: Icons.calendar_month,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
