import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:encurtei_ly/app/features/splash/splash.dart';
import 'package:encurtei_ly/app/features/splash/view_model/view_model.dart';

class SplashViewModel extends ValueNotifier<SplashViewModelState> {
  final SplashNavigator navigator;
  SplashViewModel({required this.navigator}) : super(SplashInitialState());

  Future<void> onInit(BuildContext context) async {
    await _loadAnimation();
    await Future.delayed(const Duration(seconds: 3));
    await openNextPage(context);
  }

  Future<void> openNextPage(BuildContext context) async {
    if (FirebaseAuth.instance.currentUser != null) {
      _openHomePage(context);
    } else {
      _openLoginPage(context);
    }
  }

  Future<void> _loadAnimation() async {
    value = SplashLoadingState();
    await Future.delayed(const Duration(seconds: 5));
    value = SplashSuccessState();
  }

  void _openLoginPage(BuildContext context) {
    navigator.openLoginPage(context);
  }

  void _openHomePage(BuildContext context) {
    navigator.openHomePage(context);
  }
}
