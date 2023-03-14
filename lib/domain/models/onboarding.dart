import 'package:meal_monkey/presentation/resources/assets_manager.dart';
import 'package:meal_monkey/presentation/resources/strings_manager.dart';

class OnBoarding {
  final String title;
  final String message;
  final String imageUrl;

  const OnBoarding({
    required this.title,
    required this.message,
    required this.imageUrl,
  });

  static List<OnBoarding> onBoardingObjects = const [
    OnBoarding(
        title: AppStrings.onBoardingTitle1,
        message: AppStrings.onBoardingMessage1,
        imageUrl: ImageAssets.onBoardingImage1),
    OnBoarding(
        title: AppStrings.onBoardingTitle2,
        message: AppStrings.onBoardingMessage2,
        imageUrl: ImageAssets.onBoardingImage2),
    OnBoarding(
        title: AppStrings.onBoardingTitle3,
        message: AppStrings.onBoardingMessage3,
        imageUrl: ImageAssets.onBoardingImage3)
  ];
}
