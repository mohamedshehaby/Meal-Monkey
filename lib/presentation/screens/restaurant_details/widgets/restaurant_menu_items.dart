part of '../restaurant_details_screen.dart';

class RestaurantMenuItems extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantMenuItems({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: restaurant.tags.length,
      itemBuilder: (context, index) {
        return _buildMenuItems(restaurant, context, index);
      },
    );
  }
}

Widget _buildMenuItems(Restaurant restaurant, BuildContext context, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.s20.w, vertical: AppSize.s10.h),
        child: Text(restaurant.tags[index], style: Theme.of(context).textTheme.headlineSmall),
      ),
      Column(
        children: restaurant.menuItems
            .where((menuItem) => menuItem.category == restaurant.tags[index])
            .map(
              (menuItem) => Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.s20.w,
                    ),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(menuItem.name, style: Theme.of(context).textTheme.labelLarge),
                      subtitle:
                          Text(menuItem.description, style: Theme.of(context).textTheme.bodyMedium),
                      trailing: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\$${menuItem.price}',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add_circle,
                              color: AppColor.primary,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 2,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    ],
  );
}
