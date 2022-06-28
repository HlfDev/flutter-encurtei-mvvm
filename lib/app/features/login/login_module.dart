import 'package:encurtei_ly/app/features/home/home_navigator.dart';

import 'package:encurtei_ly/app/features/login/login_navigator.dart';
import 'package:encurtei_ly/app/features/login/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

final loginModule = [
  Provider<LoginNavigator>(create: (_) => LoginNavigator()),
  ChangeNotifierProvider<LoginViewModel>(
    create: (context) => LoginViewModel(navigator: context.read()),
  ),
];
