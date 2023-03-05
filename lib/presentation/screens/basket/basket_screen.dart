import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.basket),
      ),
    );
  }
}
