import 'package:flutter/material.dart';

import 'package:encurtei_ly/app/features/home/view/pages/pages.dart';
import 'package:encurtei_ly/app/features/login/view/pages/pages.dart';

class SplashNavigator {
  void openLoginPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const LoginPage()));
  }

  void openHomePage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomePage()));
  }
}
