import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key, this.margin = true});

  final bool margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: margin ? 30 : 0),
      color: AppColors.white,
    );
  }
}
