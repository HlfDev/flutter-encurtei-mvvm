import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

import 'package:encurtei_ly/app/features/splash/splash.dart';
import 'package:encurtei_ly/app/features/splash/view/screens/screens.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...splashModule,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        initialRoute: SplashScreen.splashPageRoute,
        routes: {
          SplashScreen.splashPageRoute: (context) => const SplashScreen(),
        },
      ),
    );
  }
}
