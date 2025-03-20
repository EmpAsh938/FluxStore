class CookieData {
  final String name;
  final String value;

  CookieData(this.name, this.value);

  String get cookieText {
    return '$name=$value';
  }
}

extension CookieDataExt on List<CookieData> {
  Map<String, String> get cookieHeader {
    return {'cookie': map((e) => e.cookieText).toList().join('; ')};
  }
}
