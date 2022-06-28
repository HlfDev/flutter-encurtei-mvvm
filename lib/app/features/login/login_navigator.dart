import 'package:encurtei_ly/app/features/home/view/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginNavigator {
  void openHome(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
