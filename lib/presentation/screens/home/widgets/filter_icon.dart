part of '../home_screen.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => _navigateToFilterRoute(context),
        icon: Icon(
          Icons.menu,
          color: Theme.of(context).primaryColor,
          size: AppSize.s28.h,
        ));
  }

  _navigateToFilterRoute(BuildContext context) {
    Navigator.of(context).pushNamed(RoutesManager.filterRoute);
  }
}
