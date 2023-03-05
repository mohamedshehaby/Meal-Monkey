import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

class RestaurantListingScreen extends StatelessWidget {
  const RestaurantListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.restaurantListing),
      ),
    );
  }
}
