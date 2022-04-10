import 'package:flutter/material.dart';

import 'package:encurtei_ly/app/shared/utils/utils.dart';
import 'package:encurtei_ly/app/shared/view/widgets/widgets.dart';

class AppRoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  static const double cButtonHeight = 60.0;

  const AppRoundedButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: cPadding16),
      child: SizedBox(
        height: cButtonHeight,
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cBorderRadius),
              ))),
          child: AppText.bold(
            text: text,
            fontSize: cFontSize16,
            color: AppColors.lightBlue,
          ),
        ),
      ),
    );
  }
}
