import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:encurtei_ly/app/app_router.dart';

class SplashNavigator {
  void openLoginPage(BuildContext context) {
    context.navigateTo(const LoginRoute());
  }
}
