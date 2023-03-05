import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

class DeliveryTimeScreen extends StatelessWidget {
  const DeliveryTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.deliveryTime),
      ),
    );
  }
}
