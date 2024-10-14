import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class MoneyCategoryCard extends StatelessWidget {
  const MoneyCategoryCard({
    super.key,
    required this.id,
    required this.title,
    required this.selected,
    required this.onPressed,
  });

  final int id;
  final String title;
  final bool selected;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: selected ? AppColors.main : AppColors.black10,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CuperButton(
        onPressed: () {
          onPressed(title);
        },
        child: Row(
          children: [
            SizedBox(
              width: 48,
              child: SvgPicture.asset('assets/cat$id.svg'),
            ),
            TextR(
              title,
              fontSize: 16,
              color: AppColors.black64,
            ),
            const Spacer(),
            if (selected)
              SvgPicture.asset('assets/selected.svg')
            else
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.black10,
                ),
              ),
            const SizedBox(width: 18),
          ],
        ),
      ),
    );
  }
}
