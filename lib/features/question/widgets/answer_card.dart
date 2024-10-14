import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/question.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.id,
    required this.answer,
    required this.onPressed,
  });

  final String id;
  final Answer answer;
  final void Function(Answer) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: answer.active ? AppColors.main : AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: answer.active
            ? Border.all(
                width: 4,
                color: AppColors.white,
              )
            : null,
        boxShadow: [
          if (answer.active)
            BoxShadow(
              color: AppColors.black50,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: CuperButton(
        onPressed: () {
          onPressed(answer);
        },
        child: Stack(
          children: [
            const SizedBox(width: 20),
            Positioned(
              left: answer.active ? 16 : 20,
              top: answer.active ? 11 : 15,
              child: TextB(id, fontSize: 16),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextR(
                  answer.answer,
                  fontSize: 16,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
