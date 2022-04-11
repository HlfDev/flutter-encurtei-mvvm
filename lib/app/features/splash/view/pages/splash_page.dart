import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:encurtei_ly/app/features/splash/view/widgets/logo/logo.dart';
import 'package:encurtei_ly/app/features/splash/view_model/view_model.dart';
import 'package:encurtei_ly/app/features/splash/splash.dart';

import 'package:encurtei_ly/app/shared/utils/utils.dart';
import 'package:encurtei_ly/app/shared/view/widgets/widgets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const splashPageRoute = '/splash';

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

  late SplashViewModel _controller;

  @override
  void initState() {
    _controller = Provider.of<SplashViewModel>(context, listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _controller.onInit();
    });

    super.initState();
  }

  @override
  void dispose() {
    _controllerAnimation.dispose();
    super.dispose();
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
            ValueListenableBuilder<SplashViewModelState>(
              valueListenable: _controller,
              builder: (context, state, _) {
                switch (state.runtimeType) {
                  case SplashLoadingState:
                    return LogoAnimationWidget(asset: AppAssets.animations.svgAppLogo);
                  case SplashSuccessState:
                    return LogoStaticWidget(asset: AppAssets.vectors.svgAppLogo);
                  default:
                    return Container();
                }
              },
            ),
            const SizedBox(height: cSize16),
            AppText.bold(
              text: SplashStrings.splash.logo,
              fontSize: cFontSize48,
            ),
            const SizedBox(height: cSize16),
            AppText.light(
              text: SplashStrings.splash.slogan,
              fontSize: cFontSize16,
            ),
            const Spacer(),
            ValueListenableBuilder<SplashViewModelState>(
              valueListenable: _controller,
              builder: (context, state, child) {
                return AnimatedScale(
                  scale: state.showButton ? 1 : 0,
                  duration: const Duration(seconds: 3),
                  curve: Curves.elasticOut,
                  child: child,
                );
              },
              child: AppRoundedButton(
                text: SplashStrings.splash.enter,
                onTap: () => _controller.onEnterButtonTap(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
