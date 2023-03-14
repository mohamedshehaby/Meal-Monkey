import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/presentation/resources/routes_manager.dart';

import '../../../domain/models/restaurant.dart';
import '../../resources/colors_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(RoutesManager.restaurantDetailsRoute, arguments: restaurant),
      child: SizedBox(
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
      ),
    );
  }
}
