class HomeStrings {
  static Home home = Home();
}

class Home {
  String get title => 'Encurtei.ly';

  String get shortLinks => 'Links Encurtados';

  String get shortLink => 'Encurtar Link';

  String totalLinks(int value) => '$value links';
}
