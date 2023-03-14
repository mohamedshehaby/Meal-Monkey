import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/presentation/resources/styles_manager.dart';
import 'package:meal_monkey/presentation/resources/values_manager.dart';

import 'colors_manager.dart';
import 'font_manager.dart';

MaterialColor createMaterialColor(Color color) {
  var strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

ThemeData getAppTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: createMaterialColor(AppColor.primary), accentColor: AppColor.secondary),

    // Main AppColor
    disabledColor: AppColor.darkGrey,
    scaffoldBackgroundColor: AppColor.white,

    // ExpansionTile Theme
    expansionTileTheme: ExpansionTileThemeData(
      collapsedIconColor: AppColor.secondary,
      iconColor: AppColor.secondary,
      childrenPadding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
    ),

    // App Bar Theme
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: AppColor.transparent,
      titleTextStyle: getExtraBoldTextStyle(color: AppColor.secondary, fontSize: FontSize.s22),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // minimumSize: Size(double.infinity, AppSize.s40.h),
        textStyle: getSemiBoldTextStyle(color: AppColor.white, fontSize: FontSize.s16),
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s28.w)),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColor.primary,
        textStyle: getRegularTextStyle(color: AppColor.primary, fontSize: FontSize.s12),
      ),
    ),

    //Text Theme
    textTheme: TextTheme(
      displayLarge: getRegularTextStyle(color: AppColor.primary, fontSize: FontSize.s58),
      displayMedium: getRegularTextStyle(color: AppColor.primary, fontSize: FontSize.s46),
      displaySmall: getRegularTextStyle(color: AppColor.primary, fontSize: FontSize.s36),
      headlineLarge: getRegularTextStyle(color: AppColor.primary, fontSize: FontSize.s32),

      // OnBoarding -> title
      headlineMedium: getExtraBoldTextStyle(color: AppColor.secondary, fontSize: FontSize.s28),

      // Restaurant Details -> Restaurant name
      headlineSmall: getBoldTextStyle(color: AppColor.primary, fontSize: FontSize.s24),

      // Good Morning
      titleLarge: getExtraBoldTextStyle(color: AppColor.secondary, fontSize: FontSize.s22),

      //Location
      titleMedium: getBoldTextStyle(color: AppColor.darkGrey, fontSize: FontSize.s16),

      // Restaurant Details -> Category name
      titleSmall: getBoldTextStyle(color: AppColor.primary, fontSize: FontSize.s14),

      // Category title
      labelLarge: getBoldTextStyle(color: AppColor.secondary, fontSize: FontSize.s14),

      labelMedium: getMediumTextStyle(color: AppColor.darkGrey, fontSize: FontSize.s14),

      // Delivering to
      labelSmall: getRegularTextStyle(color: AppColor.mediumGrey, fontSize: FontSize.s14),

      bodyLarge: getBoldTextStyle(color: AppColor.secondary, fontSize: FontSize.s16),

      // Restaurant Details -> Restaurant Info
      bodyMedium: getSemiBoldTextStyle(color: AppColor.secondary, fontSize: FontSize.s14),

      bodySmall: getRegularTextStyle(color: AppColor.darkGrey, fontSize: FontSize.s12),
    ),

    bottomAppBarTheme: const BottomAppBarTheme(
      surfaceTintColor: AppColor.white,
      color: AppColor.white,
    ),

    // Form Field Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.lightGrey,
      prefixIconColor: AppColor.darkGrey,
      // content padding
      contentPadding: EdgeInsets.all(AppSize.s12.h),
      // hint style
      hintStyle: getRegularTextStyle(color: AppColor.mediumGrey, fontSize: FontSize.s14),
      // label style
      labelStyle: getMediumTextStyle(color: AppColor.darkGrey, fontSize: FontSize.s14),
      // error style
      errorStyle: getRegularTextStyle(color: AppColor.error),
      // enabled border
      enabledBorder: _getOutlineInputBorder(color: AppColor.lightGrey),
      // focused border
      focusedBorder: _getOutlineInputBorder(color: AppColor.lightGrey),
      // error border
      errorBorder: _getOutlineInputBorder(color: AppColor.error),
      // focused error border
      focusedErrorBorder: _getOutlineInputBorder(color: AppColor.primary),
    ),
  );
}

OutlineInputBorder _getOutlineInputBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: AppSize.s1.w),
    borderRadius: BorderRadius.all(Radius.circular(AppSize.s28.w)),
  );
}
