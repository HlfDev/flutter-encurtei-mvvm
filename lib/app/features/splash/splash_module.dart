import 'package:provider/provider.dart';

import 'package:encurtei_ly/app/features/splash/splash.dart';
import 'package:encurtei_ly/app/features/splash/view_model/view_model.dart';

final splashModule = [
  Provider<SplashNavigator>(create: (_) => SplashNavigator()),
  ChangeNotifierProvider<SplashViewModel>(
    create: (context) => SplashViewModel(navigator: context.read()),
  ),
];
