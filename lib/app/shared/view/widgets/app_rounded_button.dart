import 'package:flutter/material.dart';

import 'package:encurtei_ly/app/shared/utils/utils.dart';
import 'package:encurtei_ly/app/shared/view/widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';

class AppRoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  final Color backgroundColor;
  final Color textColor;

  static const double cButtonHeight = 60.0;

  final bool hasIcon;

  const AppRoundedButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
    required this.hasIcon,
  }) : super(key: key);

  const AppRoundedButton.white({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor = AppColors.white,
    this.textColor = AppColors.primary,
    this.hasIcon = false,
  }) : super(key: key);

  const AppRoundedButton.icon({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor = AppColors.white,
    this.textColor = AppColors.primary,
    this.hasIcon = true,
  }) : super(key: key);

  const AppRoundedButton.blue({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor = AppColors.secondary,
    this.textColor = AppColors.white,
    this.hasIcon = false,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (hasIcon) ...[
              const SizedBox(width: cSize16),
              SvgPicture.asset(
                AppAssets.vectors.svgIconGoogle,
                width: 32,
              ),
              const SizedBox(width: cSize16),
              Container(
                height: 40,
                width: 2,
                color: AppColors.lightGrey30,
              ),
              const Spacer(),
              AppText.medium(
                text: text,
                fontSize: cFontSize16,
                color: textColor,
              ),
              const Spacer(),
            ] else ...[
              const Spacer(),
              AppText.bold(
                text: text,
                fontSize: cFontSize16,
                color: textColor,
              ),
              const Spacer(),
            ]
          ],
        ),
      ),
    );
  }
}
