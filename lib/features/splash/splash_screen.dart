import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_home/core/services/remote/service_locator.dart';
import 'package:royal_home/core/utils/app_helper_functions.dart';

import 'package:royal_home/features/auth/UI/screens/login_screen.dart';
import 'package:royal_home/features/auth/data/auth_repository.dart';
import 'package:royal_home/features/main_nav/main_navigation_screen.dart';
import 'package:royal_home/features/splash/onboarding_screen.dart';
import 'package:royal_home/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }

  _navigateToHome() async {
    String? refreshToken = await locator<AuthRepository>().getRefreshToken();
    bool isLoggedIn = false;
    if (refreshToken != null && !isTokenExpired(refreshToken)) {
      isLoggedIn = true;
    }
    await Future.delayed(const Duration(seconds: 2), () async {
      bool iUserSeenOnBoarding = await getIsUserSeenOnBoarding();
      print(iUserSeenOnBoarding);
      if (iUserSeenOnBoarding == false) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      } else if (isLoggedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.2),
        body: Stack(
          children: [
            Image.asset(Assets.images.splashBackground.path, fit: BoxFit.cover),
            Center(
                child: Image.asset(
              Assets.images.appLogoWithText.path,
              width: 250.w,
              height: 250.h,
            )),
          ],
        ));
  }
}
