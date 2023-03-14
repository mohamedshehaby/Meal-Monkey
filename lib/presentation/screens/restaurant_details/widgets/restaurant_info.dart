part of '../restaurant_details_screen.dart';

class RestaurantInfo extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInfo({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.s20.h),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s50.h))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              restaurant.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
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
          Text(
            AppStrings.restaurantInfo,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: AppSize.s4,
          ),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
