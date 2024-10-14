import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width: 40),
        TextR('Your Balance', fontSize: 24),
        Spacer(),
        CuperButton(
          onPressed: null,
          minSize: 20,
          child: Text(
            'History',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontFamily: Fonts.regular,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        SizedBox(width: 22),
      ],
    );
  }
}
