import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/domain/models/onboarding.dart';
import 'package:meal_monkey/presentation/resources/routes_manager.dart';
import 'package:meal_monkey/presentation/resources/strings_manager.dart';
import 'package:meal_monkey/presentation/resources/values_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageViewController;

  @override
  void initState() {
    pageViewController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: ScreenUtil().screenHeight * .8,
              child: PageView.builder(
                  controller: pageViewController,
                  itemCount: OnBoarding.onBoardingObjects.length,
                  itemBuilder: (ctx, i) {
                    final onBoardingObject = OnBoarding.onBoardingObjects[i];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          onBoardingObject.imageUrl,
                          width: AppSize.s225.w,
                          height: AppSize.s300.h,
                        ),
                        SizedBox(
                          height: AppSize.s24.h,
                        ),
                        Text(
                          onBoardingObject.title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: AppSize.s40.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: AppSize.s8.w),
                          child: Text(
                            onBoardingObject.message,
                            style: Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    );
                  }),
            ),
            SizedBox(
                width: AppSize.s300.w,
                height: AppSize.s50.h,
                child: ElevatedButton(
                    onPressed: () {
                      if (pageViewController.page == OnBoarding.onBoardingObjects.length - 1) {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil(RoutesManager.homeRoute, (_) => false);
                      } else {
                        pageViewController.nextPage(
                            duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                      }
                    },
                    child: const Text(AppStrings.next)))
          ],
        ),
      ),
    );
  }
}
