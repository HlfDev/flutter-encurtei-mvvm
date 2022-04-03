class AppAssets {
  static final Vectors vectors = Vectors();
  static final Animations animations = Animations();
}

class Vectors {
  static vector(String asset) => 'assets/vectors/$asset';

  final svgAppLogo = vector('app_logo.svg');
}

class Animations {
  static animation(String asset) => 'assets/animations/$asset';

  final svgAppLogo = animation('app_logo.json');
}
