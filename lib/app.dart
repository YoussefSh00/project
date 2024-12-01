import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_home/core/services/remote/api_service.dart';
import 'package:royal_home/core/services/remote/service_locator.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/app_helper_functions.dart';
import 'package:royal_home/features/auth/cubit/auth_cubit.dart';
import 'package:royal_home/features/home/categories/cubit/categories_cubit.dart';
import 'package:royal_home/features/home/products/cubit/products_cubit.dart';
import 'package:royal_home/features/splash/splash_screen.dart';
import 'flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<AuthCubit>()),
        BlocProvider(create: (context) => locator<CategoriesCubit>()),
        BlocProvider(create: (context) => locator<ProductsCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            navigatorKey: navigatorKeyAlice,
            theme: ThemeData(
                scaffoldBackgroundColor: AppColors.white,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: AppColors.white)),
            title: F.title,
            debugShowCheckedModeBanner: false,
            home: child,
          );
        },
        child: const SplashScreen(),
      ),
    );
  }
}
