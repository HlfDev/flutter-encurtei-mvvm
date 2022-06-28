import 'package:encurtei_ly/app/features/home/home_navigator.dart';
import 'package:encurtei_ly/app/features/home/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

final homeModule = [
  Provider<HomeNavigator>(create: (_) => HomeNavigator()),
  ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(navigator: context.read()),
  ),
];
