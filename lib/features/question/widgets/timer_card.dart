import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/texts/text_r.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key, required this.seconds});

  final int seconds;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31,
      width: 111,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Center(
        child: TextM(
          formatTimer(seconds),
          fontSize: 24,
        ),
      ),
    );
  }
}
