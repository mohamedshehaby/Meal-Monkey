part of '../restaurant_details_screen.dart';

class RestaurantImage extends StatelessWidget {
  final String restaurantImage;
  const RestaurantImage({super.key, required this.restaurantImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().screenHeight * .4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(ScreenUtil().screenWidth, AppSize.s50.h)),
          image: DecorationImage(
              fit: BoxFit.cover, image: CachedNetworkImageProvider(restaurantImage))),
    );
  }
}
