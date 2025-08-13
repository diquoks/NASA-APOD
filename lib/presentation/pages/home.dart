import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

import "package:nasa_apod/data/models/astronomy_picture_model.dart";
import "package:nasa_apod/domain/use_cases/query_use_case.dart";
import "package:nasa_apod/presentation/themes/extension.dart";
import "package:nasa_apod/presentation/widgets/custom_app_bar.dart";
import "package:nasa_apod/presentation/widgets/custom_icon_button.dart";
import "package:nasa_apod/presentation/widgets/custom_text_button.dart";
import "package:nasa_apod/presentation/widgets/utils.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AstronomyPictureModel? astronomyPictureModel;
  QueryUseCase queryUseCase = QueryUseCase(
    startLoading: () {
      showLoading();
    },
    endLoading: () {
      Get.back();
    },
  );

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      queryUseCase.getApod(
        onResponse: (AstronomyPictureModel response) {
          setState(() {
            astronomyPictureModel = response;
          });
        },
        onError: (String e) {
          showError(e);
        },
      );
    });
  }

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
            child: (astronomyPictureModel != null)
                ? Image.network(astronomyPictureModel!.hdurl!)
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      color: theme.palette.icon,
                    ),
                  ),
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
                          onPressed: () {
                            showError("Недоступно");
                          },
                          icon: Icons.info,
                        ),
                      ),
                      SizedBox.square(
                        dimension: 60.r,
                        child: CustomIconButton(
                          onPressed: () {
                            showError("Недоступно");
                          },
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
                        child: SizedBox(
                          height: 60.r,
                          child: CustomTextButton(
                            onPressed: () {
                              queryUseCase.getApod(
                                onResponse: (AstronomyPictureModel response) {
                                  setState(() {
                                    astronomyPictureModel = response;
                                  });
                                },
                                onError: (String e) {
                                  showError(e);
                                },
                              );
                            },
                            text: "Получить APOD",
                          ),
                        ),
                      ),
                      SizedBox.square(
                        dimension: 60.r,
                        child: CustomIconButton(
                          onPressed: () {
                            showError("Недоступно");
                          },
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
