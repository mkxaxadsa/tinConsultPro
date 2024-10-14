import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.grey,
  fontFamily: Fonts.regular,
  colorScheme: ColorScheme.fromSwatch(
    accentColor: AppColors.white50,
  ),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
);

const cupertinoTheme = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      fontFamily: Fonts.regular,
      color: AppColors.black,
    ),
    dateTimePickerTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 24,
      fontFamily: Fonts.medium,
    ),
  ),
);
