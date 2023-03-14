import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/models/restaurant.dart';
import '../../resources/strings_manager.dart';
import '../widgets/restaurant_card.dart';

class RestaurantListingScreen extends StatelessWidget {
  final List<Restaurant> restaurants;
  const RestaurantListingScreen({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.restaurants,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        height: ScreenUtil().screenHeight,
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, i) => RestaurantCard(restaurant: restaurants[i])),
      ),
    );
  }
}
