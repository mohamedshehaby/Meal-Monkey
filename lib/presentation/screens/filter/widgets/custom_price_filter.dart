part of '../filter_screen.dart';

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FilterLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: state.filter.priceFilters
                .map((priceFilter) => GestureDetector(
                      onTap: () => context.read<FilterBloc>()..add(UpdatePriceFilter(priceFilter: priceFilter)),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSize.s32.w, vertical: AppSize.s16.h),
                        decoration: BoxDecoration(
                            color: priceFilter.value ? AppColor.primary : AppColor.lightGrey,
                            borderRadius: BorderRadius.circular(AppSize.s12.r)),
                        child: Text(
                          priceFilter.price.price,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: priceFilter.value ? AppColor.white : AppColor.secondary),
                        ),
                      ),
                    ))
                .toList(),
          );
        }
        return const Text(AppStrings.someThingWentWrong);
      },
    );
  }
}
