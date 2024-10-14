import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class CorrectAnswersDialog extends StatelessWidget {
  const CorrectAnswersDialog({
    super.key,
    required this.correctAnswers,
    required this.onRestart,
  });

  final int correctAnswers;
  final void Function() onRestart;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.main,
      child: SizedBox(
        height: 150,
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextB(
              'Correct answers $correctAnswers/20',
              fontSize: 18,
            ),
            const Spacer(),
            CuperButton(
              onPressed: onRestart,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextM(
                    'RESTART',
                    fontSize: 14,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
