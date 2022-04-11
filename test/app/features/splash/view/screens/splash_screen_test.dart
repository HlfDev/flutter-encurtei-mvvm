import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import 'package:encurtei_ly/app/features/splash/view_model/view_model.dart';

import 'package:encurtei_ly/app/features/splash/splash.dart';
import 'package:encurtei_ly/app/features/splash/view/widgets/logo/logo.dart';
import 'package:encurtei_ly/app/features/splash/view/pages/pages.dart';
import 'package:encurtei_ly/app/shared/view/widgets/widgets.dart';

import '../../splash_mocks.dart';

void main() {
  late SplashViewModel _controller;

  setUp(() {
    _controller = SplashViewModelMock();
    when(() => _controller.value).thenReturn(SplashInitialState());
    when(() => _controller.onInit()).thenAnswer((_) async => _);
  });

  Future<void> _openSplashScreen(WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider<SplashViewModel>.value(
      value: _controller,
      child: const MaterialApp(
        home: SplashPage(),
      ),
    ));
  }

  group(
    'When [SplashScreen] is called,',
    () {
      testWidgets(
        'should find Three [AppText].',
        (tester) async {
          await _openSplashScreen(tester);

          expect(find.byType(Text), findsNWidgets(3));
          expect(find.byType(AppText), findsNWidgets(3));
          expect(find.widgetWithText(AppText, SplashStrings.splash.logo), findsOneWidget);
          expect(find.widgetWithText(AppText, SplashStrings.splash.slogan), findsOneWidget);
          expect(find.widgetWithText(AppText, SplashStrings.splash.enter), findsOneWidget);
        },
      );
      testWidgets(
        'should find One [AppRoundedButton].',
        (tester) async {
          await _openSplashScreen(tester);

          expect(find.byType(AppRoundedButton), findsOneWidget);
          expect(find.byType(ElevatedButton), findsOneWidget);
          expect(find.widgetWithText(AppRoundedButton, SplashStrings.splash.enter), findsOneWidget);
        },
      );
    },
  );

  group(
    'When [SplashScreen] State is [SplashLoadingState],',
    () {
      testWidgets('should find one [LogoAnimationWidget].', (tester) async {
        when(() => _controller.value).thenReturn(SplashLoadingState());

        await _openSplashScreen(tester);

        expect(find.byType(LogoAnimationWidget), findsOneWidget);
      });

      testWidgets('should not find [LogoStaticWidget].', (tester) async {
        when(() => _controller.value).thenReturn(SplashLoadingState());

        await _openSplashScreen(tester);

        expect(find.byType(LogoStaticWidget), findsNothing);
      });
    },
  );
  group(
    'When [SplashScreen] State is [SplashSuccessState],',
    () {
      testWidgets('should find one [LogoStaticWidget].', (tester) async {
        when(() => _controller.value).thenReturn(SplashSuccessState());

        await _openSplashScreen(tester);

        expect(find.byType(LogoStaticWidget), findsOneWidget);
      });

      testWidgets('should not find [LogoAnimationWidget].', (tester) async {
        when(() => _controller.value).thenReturn(SplashSuccessState());

        await _openSplashScreen(tester);

        expect(find.byType(LogoAnimationWidget), findsNothing);
      });
    },
  );
}
