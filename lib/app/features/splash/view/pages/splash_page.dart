import 'package:encurtei_ly/app/features/splash/splash.dart';
import 'package:encurtei_ly/app/features/splash/view/widgets/logo/logo.dart';
import 'package:encurtei_ly/app/features/splash/view_model/view_model.dart';
import 'package:encurtei_ly/app/shared/utils/utils.dart';
import 'package:encurtei_ly/app/shared/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    super.initState();

    _controller = Provider.of<SplashViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.onInit(context);
    });
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
              fontSize: cFontSize24,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
