/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsGifsGen {
  const $AssetsGifsGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Pink Minimalist Mockup E-Commerce App Download Instagram Post 1.png
  AssetGenImage get pinkMinimalistMockupECommerceAppDownloadInstagramPost1 =>
      const AssetGenImage(
          'assets/images/Pink Minimalist Mockup E-Commerce App Download Instagram Post 1.png');

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/app_logo_with_text.png
  AssetGenImage get appLogoWithText =>
      const AssetGenImage('assets/images/app_logo_with_text.png');

  /// File path: assets/images/check-circle.png
  AssetGenImage get checkCircle =>
      const AssetGenImage('assets/images/check-circle.png');

  /// File path: assets/images/offer_home.png
  AssetGenImage get offerHome =>
      const AssetGenImage('assets/images/offer_home.png');

  /// File path: assets/images/online-fashion-shopping-with-laptop 1.png
  AssetGenImage get onlineFashionShoppingWithLaptop1 => const AssetGenImage(
      'assets/images/online-fashion-shopping-with-laptop 1.png');

  /// File path: assets/images/splash_background.png
  AssetGenImage get splashBackground =>
      const AssetGenImage('assets/images/splash_background.png');

  /// File path: assets/images/young-woman-doing-online-shopping-home-using-laptop-happy-satisfied-customer-with-purchase 1.png
  AssetGenImage
      get youngWomanDoingOnlineShoppingHomeUsingLaptopHappySatisfiedCustomerWithPurchase1 =>
          const AssetGenImage(
              'assets/images/young-woman-doing-online-shopping-home-using-laptop-happy-satisfied-customer-with-purchase 1.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        pinkMinimalistMockupECommerceAppDownloadInstagramPost1,
        appLogo,
        appLogoWithText,
        checkCircle,
        offerHome,
        onlineFashionShoppingWithLaptop1,
        splashBackground,
        youngWomanDoingOnlineShoppingHomeUsingLaptopHappySatisfiedCustomerWithPurchase1
      ];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/apple.svg
  String get apple => 'assets/svgs/apple.svg';

  /// File path: assets/svgs/cart_icon.svg
  String get cartIcon => 'assets/svgs/cart_icon.svg';

  /// File path: assets/svgs/categories_icon.svg
  String get categoriesIcon => 'assets/svgs/categories_icon.svg';

  /// File path: assets/svgs/google.svg
  String get google => 'assets/svgs/google.svg';

  /// File path: assets/svgs/home.svg
  String get home => 'assets/svgs/home.svg';

  /// File path: assets/svgs/home_icon.svg
  String get homeIcon => 'assets/svgs/home_icon.svg';

  /// File path: assets/svgs/notification.svg
  String get notification => 'assets/svgs/notification.svg';

  /// File path: assets/svgs/profile.svg
  String get profile => 'assets/svgs/profile.svg';

  /// File path: assets/svgs/search.svg
  String get search => 'assets/svgs/search.svg';

  /// File path: assets/svgs/shopping-cart.svg
  String get shoppingCart => 'assets/svgs/shopping-cart.svg';

  /// File path: assets/svgs/support_icon.svg
  String get supportIcon => 'assets/svgs/support_icon.svg';

  /// File path: assets/svgs/user.svg
  String get user => 'assets/svgs/user.svg';

  /// List of all assets
  List<String> get values => [
        apple,
        cartIcon,
        categoriesIcon,
        google,
        home,
        homeIcon,
        notification,
        profile,
        search,
        shoppingCart,
        supportIcon,
        user
      ];
}

class Assets {
  Assets._();

  static const $AssetsGifsGen gifs = $AssetsGifsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
