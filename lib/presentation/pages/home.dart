import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:get/get.dart";

import "package:nasa_apod/data/models/astronomy_picture_model.dart";
import "package:nasa_apod/domain/use_cases/query_use_case.dart";
import "package:nasa_apod/presentation/themes/extension.dart";
import "package:nasa_apod/presentation/widgets/custom_app_bar.dart";
import "package:nasa_apod/presentation/widgets/custom_icon_button.dart";
import "package:nasa_apod/presentation/widgets/custom_progress_indicator.dart";
import "package:nasa_apod/presentation/widgets/custom_text_button.dart";
import "package:nasa_apod/presentation/widgets/utils.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AstronomyPictureModel? astronomyPictureModel;
  DateTime? selectedDate;
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
        onError: ((String, String) errorData) {
          showMessage(title: errorData.$1, text: errorData.$2);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomTheme.of(context);
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: theme.palette.background,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          if (astronomyPictureModel != null)
            InteractiveViewer(
              maxScale: 10,
              child: Image.network(
                astronomyPictureModel!.hdurl!,
                loadingBuilder:
                    (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent? loadingProgress,
                    ) {
                      if (loadingProgress != null) {
                        return Center(
                          child: SizedBox.square(
                            dimension: 48.r,
                            child: CustomProgressIndicator(
                              value:
                                  (loadingProgress.expectedTotalBytes != null)
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      } else {
                        return child;
                      }
                    },
              ),
            )
          else
            Center(
              child: SvgPicture.asset(
                "assets/icons/nasa_logo.svg",
                width: 128.r,
                height: 128.r,
                colorFilter: ColorFilter.mode(
                  theme.palette.shadow,
                  BlendMode.modulate,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(
              top: 24.r,
              bottom: 24.r + MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox.square(
                        dimension: 60.r,
                        child: AnimatedOpacity(
                          opacity: astronomyPictureModel != null ? 1 : 0,
                          duration: Duration(milliseconds: 300),
                          child: CustomIconButton(
                            onPressed: (astronomyPictureModel != null)
                                ? () {
                                    // TODO: Consider implementing YandexTranslate
                                    showMessage(
                                      title: astronomyPictureModel!.title,
                                      text: astronomyPictureModel!.explanation
                                          .replaceAll("  ", "\n\n"),
                                    );
                                  }
                                : null,
                            icon: Icons.info,
                          ),
                        ),
                      ),
                      SizedBox.square(
                        dimension: 60.r,
                        child: CustomIconButton(
                          onPressed: () {
                            showMessage(title: "Недоступно!", text: null);
                          },
                          icon: Icons.settings,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300.r,
                  height: 60.r,
                  child: Row(
                    spacing: 12.r,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 60.r,
                          child: CustomTextButton(
                            onPressed: () {
                              queryUseCase.getApod(
                                date: selectedDate?.toString().split(" ")[0],
                                onResponse: (AstronomyPictureModel response) {
                                  setState(() {
                                    astronomyPictureModel = response;
                                  });
                                },
                                onError: ((String, String) errorData) {
                                  showMessage(
                                    title: errorData.$1,
                                    text: errorData.$2,
                                  );
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
                          onPressed: () async {
                            selectedDate =
                                await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: DateTime(1995, 6, 16),
                                  lastDate: DateTime.now(),
                                ) ??
                                selectedDate;
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
