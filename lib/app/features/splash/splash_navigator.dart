import 'package:flutter/material.dart';

import 'package:encurtei_ly/app/features/home/view/pages/pages.dart';

class SplashNavigator {
  void openLoginPage(BuildContext context) {}

  void openHomePage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomePage()));
  }
}
