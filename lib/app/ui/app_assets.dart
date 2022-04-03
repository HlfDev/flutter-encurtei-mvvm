class AppAssets {
  static final Vectors vectors = Vectors();
}

class Vectors {
  static vector(String asset) => 'assets/vectors/$asset';

  final svgAppLogo = vector('app_logo.svg');
}
