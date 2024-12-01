enum Flavor {
  prod,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'Royal Home';
      case Flavor.dev:
        return 'Royal Home dev';
      default:
        return 'title';
    }
  }

}
