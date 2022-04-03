import 'package:flutter/material.dart';

import 'package:encurtei_ly/app/shared/widgets/widgets.dart';
import 'package:encurtei_ly/app/shared/shared.dart';

class AppRoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool showButton;

  const AppRoundedButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.showButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: cPadding16),
      child: AnimatedScale(
        scale: showButton ? 1 : 0,
        duration: const Duration(seconds: 2),
        curve: Curves.elasticOut,
        child: SizedBox(
          height: 60,
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ))),
            child: AppText.bold(
              text: text,
              fontSize: cFontSize16,
              color: AppColors.lightBlue,
            ),
          ),
        ),
      ),
    );
  }
}
