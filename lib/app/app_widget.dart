import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';

import 'package:encurtei_ly/app/features/splash/presentation/pages/pages.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute: SplashPage.splashRoute,
      routes: {
        SplashPage.splashRoute: (context) => const SplashPage(),
      },
    );
  }
}
