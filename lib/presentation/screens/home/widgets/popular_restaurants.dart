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
              return Padding(
                padding: EdgeInsets.symmetric(vertical: AppSize.s8.h),
                child: RestaurantCard(restaurant: Restaurant.restaurants[i]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s300.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s8.w),
                child: CachedNetworkImage(
                  imageUrl: restaurant.imageUrl,
                  height: AppSize.s200.h,
                  width: ScreenUtil().screenWidth,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: AppSize.s10.w,
                top: AppSize.s10.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.s4.w, vertical: AppSize.s4.h),
                  width: AppSize.s64.w,
                  height: AppSize.s28.h,
                  decoration: BoxDecoration(
                      color: AppColor.white, borderRadius: BorderRadius.circular(AppSize.s8.w)),
                  child: Text(
                    "${restaurant.deliveryTime} min",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: AppSize.s8,
          ),
          Text(
            restaurant.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: AppSize.s4,
          ),
          Row(
            children: restaurant.tags
                .map((tag) => Text(
                      "$tag ",
                      style: Theme.of(context).textTheme.labelSmall,
                    ))
                .toList(),
          ),
          const SizedBox(
            height: AppSize.s4,
          ),
          Row(
            children: [
              Text(
                '${restaurant.distance}km - ',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                '\$${restaurant.deliveryFee} ${AppStrings.deliveryFee}',
                style: Theme.of(context).textTheme.labelLarge,
              )
            ],
          ),
        ],
      ),
    );
  }
}
