import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class LogoAnimationWidget extends StatelessWidget {
  static const double cLogoHeight = 200;
  final String asset;
  const LogoAnimationWidget({
    Key? key,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cLogoHeight,
      child: Center(
        child: Lottie.asset(
          asset,
          repeat: false,
        ),
      ),
    );
  }
}
