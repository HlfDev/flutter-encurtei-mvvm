import 'package:auto_route/auto_route.dart';

import 'package:encurtei_ly/app/features/login/view/pages/pages.dart';

import 'package:encurtei_ly/app/features/splash/view/pages/pages.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: LoginPage),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
