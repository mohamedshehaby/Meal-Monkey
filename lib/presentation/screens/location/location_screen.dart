import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meal_monkey/presentation/blocs/location/location_bloc.dart';
import 'package:meal_monkey/presentation/resources/assets_manager.dart';
import 'package:meal_monkey/presentation/resources/colors_manager.dart';
import 'package:meal_monkey/presentation/resources/strings_manager.dart';
import 'package:meal_monkey/presentation/resources/values_manager.dart';

import '../../blocs/places/places_bloc.dart';

part 'widgets/OS_Map.dart';
part 'widgets/location_search_box.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const OSMap(),
          Positioned(
            top: AppSize.s50.h,
            right: AppSize.s0,
            left: AppSize.s0,
            child: const LocationSearchBox(),
          ),
          Positioned(
            right: ScreenUtil().screenWidth * .1,
            width: ScreenUtil().screenWidth * .8,
            bottom: AppSize.s50.h,
            child: ElevatedButton(onPressed: () {}, child: const Text(AppStrings.save)),
          ),
        ],
      ),
    );
  }
}
