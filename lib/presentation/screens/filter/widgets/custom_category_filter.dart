part of '../filter_screen.dart';

class CustomCategoryFilter extends StatelessWidget {
  final List<Category> categories;

  const CustomCategoryFilter({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(builder: (context, state) {
      if (state is FilterLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is FilterLoaded) {
        final categoryFilters = state.filter.categoryFilters;
        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categoryFilters.length,
            itemBuilder: (ctx, i) {
              final categoryFilter = categoryFilters[i];
              return ListTile(
                title: Text(categoryFilter.category.name),
                trailing: Checkbox(
                  value: categoryFilter.value,
                  onChanged: (_) => context
                      .read<FilterBloc>()
                      .add(UpdateCategoryFilter(categoryFilter: categoryFilter)),
                ),
              );
            });
      }

      return const Text(AppStrings.someThingWentWrong);
    });
  }
}
