import 'package:encurtei_ly/app/features/home/home_module.dart';
import 'package:encurtei_ly/app/features/home/view/pages/pages.dart';
import 'package:encurtei_ly/app/features/login/login_module.dart';
import 'package:encurtei_ly/app/features/splash/view/pages/pages.dart';
import 'package:encurtei_ly/app/shared/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:encurtei_ly/app/features/splash/splash.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...splashModule,
        ...homeModule,
        ...loginModule,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => const HomePage(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.white),
          primaryColor: AppColors.secondary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          highlightColor: AppColors.primary,
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
