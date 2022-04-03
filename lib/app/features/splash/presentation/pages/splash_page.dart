import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:encurtei_ly/app/shared/widgets/widgets.dart';
import 'package:encurtei_ly/app/shared/shared.dart';

import 'package:encurtei_ly/app/features/splash/splash.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const splashRoute = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controllerAnimation = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controllerAnimation,
    curve: Curves.easeInOutQuart,
  );

  late bool showButton = false;

  @override
  void dispose() {
    _controllerAnimation.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showButton = !showButton;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplateGradient(
      body: FadeTransition(
        opacity: _animation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Center(
                    child: Lottie.asset(
                      AppAssets.animations.svgAppLogo,
                      repeat: false,
                    ),
                  ),
                  Center(
                    child: AnimatedScale(
                      scale: showButton ? 1 : 0,
                      curve: Curves.elasticOut,
                      duration: const Duration(seconds: 2),
                      child: SvgPicture.asset(AppAssets.vectors.svgAppLogo),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: cSize16),
            AppText.bold(
              text: SplashStrings.splashPage.logo,
              fontSize: cFontSize48,
            ),
            const SizedBox(height: cSize16),
            AppText.light(
              text: SplashStrings.splashPage.slogan,
              fontSize: cFontSize16,
            ),
            const Spacer(),
            AppRoundedButton(
              text: SplashStrings.splashPage.enter,
              showButton: showButton,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
