import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.restaurantDetails),
      ),
    );
  }
}
