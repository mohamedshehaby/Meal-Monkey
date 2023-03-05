part of '../home_screen.dart';

class FoodSearchBox extends StatelessWidget {
  const FoodSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: AppSize.s30),
      child: TextField(
        decoration: InputDecoration(
          hintText: AppStrings.searchFood,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
