import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/presentation/resources/strings_manager.dart';
import 'package:meal_monkey/presentation/resources/values_manager.dart';

import '../../../domain/models/restaurant.dart';
import '../../resources/colors_manager.dart';

part 'widgets/restaurant_image.dart';
part 'widgets/restaurant_info.dart';
part 'widgets/restaurant_menu_items.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantDetailsScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.transparent,
        foregroundColor: AppColor.white,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            RestaurantImage(restaurantImage: restaurant.imageUrl),
            RestaurantInfo(restaurant: restaurant),
            RestaurantMenuItems(restaurant: restaurant)
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s64.w),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(),
            child: const Text(AppStrings.basket),
          ),
        ),
      ),
    );
  }
}
