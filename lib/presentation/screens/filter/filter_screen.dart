import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.filter),
      ),
    );
  }
}