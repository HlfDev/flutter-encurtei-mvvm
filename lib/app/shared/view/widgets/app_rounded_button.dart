import 'package:flutter/material.dart';

import 'package:encurtei_ly/app/shared/utils/utils.dart';
import 'package:encurtei_ly/app/shared/view/widgets/widgets.dart';

class AppRoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  final Color backgroundColor;
  final Color textColor;

  static const double cButtonHeight = 60.0;

  const AppRoundedButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  const AppRoundedButton.white({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor = AppColors.white,
    this.textColor = AppColors.lightBlue,
  }) : super(key: key);

  const AppRoundedButton.blue({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor = AppColors.darkBlue,
    this.textColor = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cButtonHeight,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cBorderRadius),
            ))),
        child: AppText.bold(
          text: text,
          fontSize: cFontSize16,
          color: textColor,
        ),
      ),
    );
  }
}
