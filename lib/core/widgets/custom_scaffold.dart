import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.main,
            ),
          ),
          body,
        ],
      ),
    );
  }
}
