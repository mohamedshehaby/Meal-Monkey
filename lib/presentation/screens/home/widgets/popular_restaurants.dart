part of '../home_screen.dart';

class PopularRestaurants extends StatelessWidget {
  const PopularRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: AppSize.s40.h, top: AppSize.s20.h),
          child: Text(
            AppStrings.popularRestaurants,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: ScreenUtil().screenHeight / 2,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: Restaurant.restaurants.length,
            itemBuilder: (ctx, i) {
              final restaurant = Restaurant.restaurants[i];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: AppSize.s8.h),
                child: RestaurantCard(restaurant: restaurant),
              );
            },
          ),
        ),
      ],
    );
  }
}
