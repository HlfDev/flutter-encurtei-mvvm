import 'package:encurtei_ly/app/features/login/google_sign_in.dart';
import 'package:encurtei_ly/app/features/login/login_navigator.dart';
import 'package:encurtei_ly/app/features/login/view_model/login_view_model_state.dart';

import 'package:flutter/material.dart';

class LoginViewModel extends ValueNotifier<LoginViewModelState> {
  LoginNavigator navigator;

  LoginViewModel({required this.navigator}) : super(LoginViewModelInitialState());

  Future<void> loginAndOpenHomePage(BuildContext context) async {
    await signInWithGoogle();
    navigator.openHome(context);
  }
}
