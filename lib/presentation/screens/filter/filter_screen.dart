import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/models/category.dart';
import '../../blocs/filter/filter_bloc.dart';
import '../../resources/colors_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

part 'widgets/custom_category_filter.dart';
part 'widgets/custom_price_filter.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.filter),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s16.w, vertical: AppSize.s8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.price,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const CustomPriceFilter(),
              Text(
                AppStrings.category,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const CustomCategoryFilter(
                categories: Category.categories,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s64.w),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(),
            child: const Text(AppStrings.apply),
          ),
        ),
      ),
    );
  }
}
