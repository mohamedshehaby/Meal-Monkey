part of '../home_screen.dart';

class CategoryMenu extends StatelessWidget {
  const CategoryMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSize.s30),
      height: AppSize.s120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cat.Category.categories.length,
          itemBuilder: (ctx, i) {
            final category = cat.Category.categories[i];
            final resturants = Restaurant.restaurants
                .where((restaurant) => restaurant.tags.contains(category.name))
                .toList();
            return GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(RoutesManager.restaurantListingRoute, arguments: resturants),
              child: Padding(
                padding: const EdgeInsets.only(right: AppSize.s20),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      child: CachedNetworkImage(
                        width: AppSize.s88,
                        height: AppSize.s88,
                        fit: BoxFit.cover,
                        imageUrl: cat.Category.categories[i].imageUrl,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                    Text(
                      cat.Category.categories[i].name,
                      style: Theme.of(context).textTheme.labelLarge,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
