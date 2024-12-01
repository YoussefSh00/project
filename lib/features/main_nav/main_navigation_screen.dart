import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_home/core/components/main_app_button.dart';
import 'package:royal_home/core/services/remote/service_locator.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/app_helper_functions.dart';
import 'package:royal_home/core/utils/text_style.dart';
import 'package:royal_home/features/auth/UI/screens/login_screen.dart';
import 'package:royal_home/features/auth/cubit/auth_cubit.dart';
import 'package:royal_home/features/home/UI/screens/home_screen.dart';
import 'package:royal_home/gen/assets.gen.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class MainNavigationScreen extends StatefulWidget {
  final int? currentIndex;

  const MainNavigationScreen({super.key, this.currentIndex});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  List<Widget> bodies = [
    const HomeScreen(),
    const Text("data"),
    const Text("data"),
    Column(
      children: [
        const Text("data"),
        MainAppButton(
            title: "logout",
            fun: () {
              locator<AuthCubit>().logout();
              navigatorKeyAlice.currentState?.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            })
      ],
    ),
    const Text("data"),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(),
      backgroundColor: Colors.white,
      body: bodies[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 23,
            offset: const Offset(0, 4),
          ),
        ], borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.textPrimaryAccentHeavy,
            selectedLabelStyle: AppText.nunitoSemiBold12,
            unselectedLabelStyle: AppText.nunitoRegular12,
            unselectedItemColor: AppColors.textPrimaryMedium,
            iconSize: 24.sp,
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            items: [
              _buildBottomNavItem(
                icon: Assets.svgs.homeIcon,
                label: "Home",
                isSelected: _currentIndex == 0,
              ),
              _buildBottomNavItem(
                icon: Assets.svgs.categoriesIcon,
                label: "Categories",
                isSelected: _currentIndex == 1,
              ),
              _buildBottomNavItem(
                icon: Assets.svgs.cartIcon,
                label: "Cart",
                isSelected: _currentIndex == 2,
              ),
              _buildBottomNavItem(
                icon: Assets.svgs.profile,
                label: "Profile",
                isSelected: _currentIndex == 3,
              ),
              _buildBottomNavItem(
                icon: Assets.svgs.supportIcon,
                label: "Support",
                isSelected: _currentIndex == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem({
    required String icon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            color: isSelected
                ? AppColors.textPrimaryAccentHeavy
                : AppColors.textPrimaryMedium,
          ),
          4.verticalSpace,
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? AppColors.textPrimaryAccentHeavy
                  : AppColors.textPrimaryMedium,
              fontSize: 12.sp,
            ),
          ),
          if (isSelected) ...[
            SizedBox(height: 2.h),
            Container(
              width: 4.w,
              height: 4.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.textPrimaryAccentHeavy,
              ),
            )
          ]
        ],
      ),
      label: "",
    );
  }
}
