import 'package:flutter/material.dart';
import 'package:meal_monkey/presentation/resources/strings_manager.dart';
import 'package:meal_monkey/presentation/screens/basket/basket_screen.dart';
import 'package:meal_monkey/presentation/screens/checkout/checkout_screen.dart';
import 'package:meal_monkey/presentation/screens/delivery_time/delivery_time_screen.dart';
import 'package:meal_monkey/presentation/screens/filter/filter_screen.dart';
import 'package:meal_monkey/presentation/screens/restaurant_details/restaurant_details_screen.dart';
import 'package:meal_monkey/presentation/screens/restaurant_listing/restaurant_listing_screen.dart';
import 'package:meal_monkey/presentation/screens/splash_screen/splash_screen.dart';
import 'package:meal_monkey/presentation/screens/voucher/voucher_screen.dart';

import '../screens/home/home_screen.dart';
import '../screens/location/location_screen.dart';

class RoutesManager {
  RoutesManager._();

  static const splashRoute = 'splashRoute';
  static const homeRoute = 'homeRoute';
  static const locationRoute = 'locationRoute';
  static const basketRoute = 'basketRoute';
  static const checkOutRoute = 'checkOutRoute';
  static const deliveryTimeRoute = 'deliveryTimeRoute';
  static const filterRoute = 'filterRoute';
  static const restaurantDetailsRoute = 'restaurantDetailsRoute';
  static const restaurantListingRoute = 'restaurantListingRoute';
  static const voucherRoute = 'restaurantListingRoute';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case locationRoute:
        return MaterialPageRoute(builder: (context) => const LocationScreen());
      case basketRoute:
        return MaterialPageRoute(builder: (context) => const BasketScreen());
      case checkOutRoute:
        return MaterialPageRoute(builder: (context) => const CheckoutScreen());
      case deliveryTimeRoute:
        return MaterialPageRoute(builder: (context) => const DeliveryTimeScreen());
      case filterRoute:
        return MaterialPageRoute(builder: (context) => const FilterScreen());
      case restaurantDetailsRoute:
        return MaterialPageRoute(builder: (context) => const RestaurantDetailsScreen());
      case restaurantListingRoute:
        return MaterialPageRoute(builder: (context) => const RestaurantListingScreen());
      case voucherRoute:
        return MaterialPageRoute(builder: (context) => const VoucherScreen());
      default:
        return _unKnownRoute();
    }
  }

  static Route _unKnownRoute() {
    return MaterialPageRoute<Widget>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.noRouteFound),
          ),
          body: const Center(
            child: Text(AppStrings.noRouteFound),
          ),
        );
      },
    );
  }
}
