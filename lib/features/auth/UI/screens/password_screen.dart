import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_home/core/components/app_bar_widget.dart';
import 'package:royal_home/core/components/app_text_feild.dart';
import 'package:royal_home/core/components/main_app_button.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/status.dart';
import 'package:royal_home/core/utils/text_style.dart';
import 'package:royal_home/features/auth/UI/screens/otp_screen.dart';

import 'package:royal_home/features/auth/UI/widgets/change_password_dialog.dart';
import 'package:royal_home/features/auth/cubit/auth_cubit.dart';
import 'package:royal_home/features/auth/cubit/auth_state.dart';
import 'package:royal_home/features/main_nav/main_navigation_screen.dart';
import 'package:royal_home/gen/assets.gen.dart';

class PasswordScreen extends StatelessWidget {
  PasswordScreen(
      {super.key,
      required this.isPhoneNumber,
      required this.emailOrPhoneNumber});
  final TextEditingController _passwordController = TextEditingController();
  final bool isPhoneNumber;
  final String emailOrPhoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBarWidget(),
      ),
      body: Padding(
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
                  hint: "Password",
                  label: "enter your password",
                  controller: _passwordController),
              10.verticalSpace,
              isPhoneNumber
                  ? SizedBox()
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          context.read<AuthCubit>().forgetPassword(
                              email: emailOrPhoneNumber,
                              isEmail: emailOrPhoneNumber.contains("@"));
                        },
                        child: Text("Forget Password?",
                            style: AppText.nunitoBold11.copyWith(
                                color: AppColors.blue,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.blue,
                                decorationThickness: 2)),
                      ),
                    ),
              80.verticalSpace,
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state.loginState == RequestStatus.loaded) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainNavigationScreen(),
                      ),
                      (route) => false,
                    );
                  } else if (state.loginState == RequestStatus.failure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.errorMessageModel?.message ?? "")));
                  } else if (state.forgetPasswordState ==
                      RequestStatus.loaded) {
                    // showDialog(
                    //   barrierDismissible: false,
                    //   context: context,
                    //   builder: (context) {
                    //     return const ChangePasswordDialog();
                    //   },
                    // );
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return OTPScreen(
                          emailOrPhoneNumber: emailOrPhoneNumber,
                          isVerifcation: true,
                        );
                      },
                    ));
                  } else if (state.forgetPasswordState ==
                      RequestStatus.failure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.errorMessageModel?.message ?? "")));
                  }
                },
                builder: (context, state) {
                  return MainAppButton(
                      isLoading: state.loginState == RequestStatus.loading ||
                          state.forgetPasswordState == RequestStatus.loading,
                      title: "Login",
                      fun: () {
                        context.read<AuthCubit>().login(
                            emailOrPhoneNumber: emailOrPhoneNumber,
                            isEmail: emailOrPhoneNumber.contains("@"),
                            password: _passwordController.text);
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
