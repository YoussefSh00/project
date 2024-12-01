import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_home/app.dart';
import 'package:royal_home/core/components/main_app_button.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/app_helper_functions.dart';
import 'package:royal_home/core/utils/text_style.dart';
import 'package:royal_home/features/auth/UI/screens/login_screen.dart';
import 'package:royal_home/features/splash/onborarding_widget.dart';
import 'package:royal_home/gen/assets.gen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onNextPressed() {
    if (_currentIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      setIsUserSeenOnBoarding(true);
    }
  }

  List<Widget> _buildPages() {
    return [
      OnborardingWidget(
        image: Assets
            .images
            .youngWomanDoingOnlineShoppingHomeUsingLaptopHappySatisfiedCustomerWithPurchase1
            .path,
        title: "Your One-Stop Shop for Everything!",
        subTitle:
            "From daily essentials to exclusive finds, explore\n endless possibilities with just a tap.",
      ),
      OnborardingWidget(
        image: Assets
            .images.pinkMinimalistMockupECommerceAppDownloadInstagramPost1.path,
        title: "Shop Smarter, Live Better!",
        subTitle:
            "Discover a world of exclusive deals, seamless\n shopping, and unbeatable prices.",
      ),
      OnborardingWidget(
        image: Assets.images.onlineFashionShoppingWithLaptop1.path,
        title: "Shop the World at Your Fingertips!",
        subTitle:
            "Connect to top brands and exclusive offers anytime, anywhere.",
      ),
    ];
  }

  List<Widget> _buildIndicators() {
    return List.generate(3, (index) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        height: 10,
        width: _currentIndex == index ? 30 : 10,
        decoration: BoxDecoration(
          color:
              _currentIndex == index ? AppColors.blue : AppColors.primaryHeavy,
          borderRadius: BorderRadius.circular(5),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          50.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ..._buildIndicators(),
              105.horizontalSpace,
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                  setIsUserSeenOnBoarding(true);
                },
                child: Text("Skip",
                    style: AppText.nunitoMedium14
                        .copyWith(decoration: TextDecoration.underline)),
              ),
              20.horizontalSpace,
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: _buildPages(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: MainAppButton(
                title: _currentIndex == 2 ? "Login" : "Next",
                fun: _onNextPressed),
          ),
        ],
      ),
    );
  }
}
