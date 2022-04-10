import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class LogoStaticWidget extends StatelessWidget {
  static const double cLogoHeight = 200;

  final String asset;
  const LogoStaticWidget({
    Key? key,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cLogoHeight,
      child: Center(
        child: AnimatedScale(
          scale: 1,
          curve: Curves.elasticOut,
          duration: const Duration(seconds: 2),
          child: SvgPicture.asset(asset),
        ),
      ),
    );
  }
}
