import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_home/core/components/app_bar_widget.dart';
import 'package:royal_home/core/components/app_text_feild.dart';
import 'package:royal_home/core/components/main_app_button.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/status.dart';
import 'package:royal_home/core/utils/text_style.dart';
import 'package:royal_home/features/auth/UI/screens/otp_screen.dart';
import 'package:royal_home/features/auth/UI/screens/password_screen.dart';
import 'package:royal_home/features/auth/UI/screens/signup_screen.dart';
import 'package:royal_home/features/auth/UI/widgets/third_party_auth_widget.dart';
import 'package:royal_home/features/auth/cubit/auth_cubit.dart';
import 'package:royal_home/features/auth/cubit/auth_state.dart';
import 'package:royal_home/features/main_nav/main_navigation_screen.dart';
import 'package:royal_home/gen/assets.gen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBarWidget(
          leadingWidget: const SizedBox(),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                38.verticalSpace,
                Text(
                  "Welcome Back!",
                  style: AppText.nunitoBold22,
                ),
                8.verticalSpace,
                Text(
                  "Login to your account",
                  style: AppText.nunitoRegular14,
                ),
                48.verticalSpace,
                AppTextFeild(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Email / Phone number";
                      }
                      return null;
                    },
                    hint: "enter your email or phone number",
                    label: "Email / Phone number",
                    controller: _emailController),
                43.verticalSpace,
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state.verifyOtpState == RequestStatus.loaded) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTPScreen(
                              isVerifcation: false,
                              emailOrPhoneNumber: _emailController.text,
                            ),
                          ));
                    } else if (state.verifyOtpState == RequestStatus.failure) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.errorMessageModel?.message ?? ""),
                      ));
                    } else if (state.loginWithGoogleState ==
                        RequestStatus.loaded) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MainNavigationScreen()));
                    }
                  },
                  builder: (context, state) {
                    return MainAppButton(
                        title: "Login",
                        fun: () {
                          if (formKey.currentState!.validate()) {
                            String s = _emailController.text;
                            if (s.contains("@")) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PasswordScreen(
                                      emailOrPhoneNumber: _emailController.text,
                                      isPhoneNumber: false,
                                    ),
                                  ));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OTPScreen(
                                          isVerifcation: false,
                                          emailOrPhoneNumber:
                                              _emailController.text)));
                            }
                          }
                        });
                  },
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account?",
                        style: AppText.nunitoLight16),
                    8.horizontalSpace,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ));
                      },
                      child: Text("Sign Up",
                          style: AppText.nunitoBold11.copyWith(
                              color: AppColors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.blue,
                              decorationThickness: 2)),
                    ),
                  ],
                ),
                18.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 110.w,
                      height: 1.h,
                      color: AppColors.black,
                    ),
                    7.horizontalSpace,
                    Text(
                      "Or login with",
                      style: AppText.nunitoMedium14,
                    ),
                    7.horizontalSpace,
                    Container(
                      width: 110.w,
                      height: 1.h,
                      color: AppColors.black,
                    ),
                  ],
                ),
                20.verticalSpace,
                Platform.isIOS
                    ? Align(
                        alignment: Alignment.center,
                        child: ThirdPartyAuthWidget(
                            assetName: Assets.svgs.apple, text: "Apple"),
                      )
                    : const SizedBox(),
                20.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: ThirdPartyAuthWidget(
                      assetName: Assets.svgs.google, text: "Google"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
