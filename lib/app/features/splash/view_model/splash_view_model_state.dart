abstract class SplashViewModelState {
  bool get showButton => false;
}

class SplashInitialState extends SplashViewModelState {}

class SplashLoadingState extends SplashViewModelState {}

class SplashSuccessState extends SplashViewModelState {
  @override
  final bool showButton = true;
}
