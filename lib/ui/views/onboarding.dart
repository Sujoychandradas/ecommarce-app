import 'package:ecommarce_app/const/app_colors.dart';
import 'package:ecommarce_app/model/intro.dart';
import 'package:ecommarce_app/ui/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: IntroScreenOnboarding(
        backgroudColor: Colors.transparent,
        introductionList: introData
            .map(
              (e) => Introduction(
                  imageHeight: 180.h,
                  titleTextStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  subTitleTextStyle: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                  ),
                  imageUrl: e.image,
                  title: e.title,
                  subTitle: e.description),
            )
            .toList(),
        foregroundColor: AppColors.mandarinColor,
        skipTextStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),
        onTapSkipButton: () => Get.toNamed(login),
      )),
    );
  }
}
