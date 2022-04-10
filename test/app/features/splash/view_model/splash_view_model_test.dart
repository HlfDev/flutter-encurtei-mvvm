import 'package:flutter_test/flutter_test.dart';

import 'package:encurtei_ly/app/features/splash/splash.dart';
import 'package:encurtei_ly/app/features/splash/view_model/view_model.dart';

import '../splash_mocks.dart';

void main() {
  late SplashViewModel _controller;
  late SplashNavigator _navigator;

  setUp(() {
    _navigator = SplashNavigatorMock();
    _controller = SplashViewModel(navigator: _navigator);
  });

  group('When [SplashViewModel] - [onInit] function is called,', () {
    test('should emit [SplashInitialState].', () async {
      // Assert
      expect(_controller.value, isA<SplashInitialState>());
    });
    test('should change [SplashViewModelState] to [SplashLoadingState].', () async {
      // Act
      _controller.onInit();

      // Assert
      expect(_controller.value, isA<SplashLoadingState>());
    });
    test('should change [SplashViewModelState] to [SuccessState].', () async {
      // Act
      await _controller.onInit();

      // Assert
      expect(_controller.value, isA<SplashSuccessState>());
    });
  });
}
