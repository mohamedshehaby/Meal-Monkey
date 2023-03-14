import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.voucher),
      ),
    );
  }
}
