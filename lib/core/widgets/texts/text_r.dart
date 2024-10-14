import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class TextR extends StatelessWidget {
  const TextR(
    this.title, {
    super.key,
    required this.fontSize,
    this.color = AppColors.black,
    this.textAlign,
    this.maxLines,
  });

  final String title;
  final double fontSize;
  final Color color;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: Fonts.regular,
      ),
    );
  }
}

class TextM extends StatelessWidget {
  const TextM(
    this.title, {
    super.key,
    required this.fontSize,
    this.color = AppColors.black,
    this.textAlign,
    this.maxLines,
  });

  final String title;
  final double fontSize;
  final Color color;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: Fonts.medium,
      ),
    );
  }
}

class TextB extends StatelessWidget {
  const TextB(
    this.title, {
    super.key,
    required this.fontSize,
    this.color = AppColors.black,
    this.textAlign,
    this.maxLines,
  });

  final String title;
  final double fontSize;
  final Color color;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: Fonts.bold,
      ),
    );
  }
}

class TextE extends StatelessWidget {
  const TextE(
    this.title, {
    super.key,
    required this.fontSize,
    this.color = AppColors.black,
    this.textAlign,
    this.maxLines,
  });

  final String title;
  final double fontSize;
  final Color color;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: Fonts.extra,
      ),
    );
  }
}
