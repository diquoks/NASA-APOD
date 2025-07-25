import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

import "package:nasa_apod/presentation/pages/home.dart";
import "package:nasa_apod/presentation/themes/extension.dart";
import "package:nasa_apod/presentation/themes/palette.dart";

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(402, 874),
      builder: (BuildContext context, Widget? widget) {
        return GetMaterialApp(
          title: "NASA APOD",
          theme: ThemeData.dark().copyWith(extensions: [CustomTheme(palette: DarkPalette())]),
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
