import 'dart:async';

import 'package:flutter/material.dart';

import 'package:encurtei_ly/app/features/splash/splash.dart';
import 'package:encurtei_ly/app/features/splash/view_model/view_model.dart';

class SplashViewModel extends ValueNotifier<SplashViewModelState> {
  final SplashNavigator navigator;
  SplashViewModel({required this.navigator}) : super(SplashInitialState());

  Future<void> onInit() async {
    await _loadAnimation();
  }

  void onEnterButtonTap(BuildContext context) {
    _openNextPage(context);
  }

  Future<void> _loadAnimation() async {
    value = SplashLoadingState();

    await Future.delayed(const Duration(seconds: 5));

    value = SplashSuccessState();
  }

  void _openNextPage(BuildContext context) {
    navigator.openLoginPage(context);
  }
}
