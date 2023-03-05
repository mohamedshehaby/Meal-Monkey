import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/domain/models/category.dart' as cat;
import 'package:meal_monkey/domain/models/restaurant.dart';
import 'package:meal_monkey/presentation/blocs/location/location_bloc.dart';
import 'package:meal_monkey/presentation/resources/colors_manager.dart';
import 'package:meal_monkey/presentation/resources/routes_manager.dart';

import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

part 'widgets/category_menu.dart';
part 'widgets/food_search_box.dart';
part 'widgets/popular_restaurants.dart';
part 'widgets/user_location.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          AppStrings.goodMorning,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed(RoutesManager.basketRoute),
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            UserLocation(),
            FoodSearchBox(),
            CategoryMenu(),
            PopularRestaurants(),
          ],
        ),
      )),
    );
  }
}
