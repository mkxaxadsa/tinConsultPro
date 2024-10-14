import 'package:flutter/cupertino.dart';

import '../../config/app_colors.dart';
import '../texts/text_r.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.active = true,
    this.white = false,
    this.width,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final bool white;
  final double? width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: width,
      decoration: BoxDecoration(
        color: white ? AppColors.white : AppColors.main,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: active ? onPressed : null,
        padding: EdgeInsets.zero,
        child: Center(
          child: TextR(
            title,
            fontSize: 16,
            color: active
                ? white
                    ? AppColors.black
                    : AppColors.black
                : white
                    ? AppColors.white50
                    : AppColors.black10,
          ),
        ),
      ),
    );
  }
}
