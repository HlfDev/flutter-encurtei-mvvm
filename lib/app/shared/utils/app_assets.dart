class AppAssets {
  static final Vectors vectors = Vectors();
  static final Animations animations = Animations();
}

class Vectors {
  static vector(String asset) => 'assets/vectors/$asset';

  final svgAppLogo = vector('app_logo.svg');

  final svgIconSearch = vector('ic_search.svg');
  final svgIconLink = vector('ic_link.svg');
  final svgIconDescription = vector('ic_description.svg');
  final svgIconGoogle = vector('ic_google.svg');

  final svgLogin = vector('login.svg');
}

class Animations {
  static animation(String asset) => 'assets/animations/$asset';

  final svgAppLogo = animation('app_logo.json');
}
