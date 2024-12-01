import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:royal_home/core/components/app_bar_widget.dart';
import 'package:royal_home/core/components/main_app_button.dart';
import 'package:royal_home/core/components/otp_component.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/status.dart';
import 'package:royal_home/core/utils/text_style.dart';
import 'package:royal_home/features/auth/UI/screens/login_screen.dart';

import 'package:royal_home/features/auth/UI/screens/password_screen.dart';
import 'package:royal_home/features/auth/UI/screens/reset_password_screen.dart';
import 'package:royal_home/features/auth/cubit/auth_cubit.dart';
import 'package:royal_home/features/auth/cubit/auth_state.dart';
import 'package:royal_home/features/main_nav/main_navigation_screen.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen(
      {super.key,
      required this.emailOrPhoneNumber,
      required this.isVerifcation});
  final String emailOrPhoneNumber;
  final bool isVerifcation;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  void initState() {
    super.initState();
    _startTimer();

    if (widget.emailOrPhoneNumber.contains("@") == false) {
      context.read<AuthCubit>().sendPhoneOtp(phone: widget.emailOrPhoneNumber);
    }
  }

  late String otp;
  late Timer _timer;
  int _remainingTime = 60;
  bool _canResendOtp = false; // this

  void _startTimer() {
    setState(() {
      _remainingTime = 60;
      _canResendOtp = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel();
        setState(() {
          _canResendOtp = true;
        });
      }
    });
  }

  void _resendOtp() {
    if (_canResendOtp && widget.emailOrPhoneNumber.contains("@")) {
      context.read<AuthCubit>().forgetPassword(
          email: widget.emailOrPhoneNumber,
          isEmail: widget.emailOrPhoneNumber.contains("@"));
      _startTimer();
    } else {
      context.read<AuthCubit>().sendPhoneOtp(phone: widget.emailOrPhoneNumber);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              38.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.isVerifcation == false
                      ? "Welcome Back!"
                      : "Forget Password",
                  style: AppText.nunitoBold22,
                ),
              ),
              8.verticalSpace,
              Text(
                "We will send you a 6-digit one time passcode for mobile number verification.",
                style: AppText.nunitoRegular14,
              ),
              24.verticalSpace,
              OtpComponent(
                onCompleted: (value) {
                  setState(() {
                    otp = value;
                    print("asdasassa: $otp");
                  });
                },
              ),
              16.verticalSpace,
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: "Request a new code in ",
                    style: AppText.nunitoRegular14,
                  ),
                  TextSpan(
                    text: "$_remainingTime",
                    style:
                        AppText.nunitoRegular14.copyWith(color: AppColors.blue),
                  ),
                  TextSpan(
                    text: " sec",
                    style: AppText.nunitoRegular14,
                  )
                ],
              )),
              8.verticalSpace,
              GestureDetector(
                onTap: _canResendOtp == true
                    ? () {
                        _resendOtp();
                      }
                    : null,
                child: Text(
                  "Resend code",
                  style: AppText.nunitoRegular14.copyWith(
                      color: _canResendOtp == true
                          ? AppColors.blue
                          : AppColors.grey),
                ),
              ),
              35.verticalSpace,
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state.verifySignUpState == RequestStatus.loaded) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  } else if (state.verifySignUpState == RequestStatus.failure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.errorMessageModel?.message ?? "")));
                  } else if (state.loginWithOTPState == RequestStatus.loaded) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MainNavigationScreen()));
                  } else if (state.loginWithOTPState == RequestStatus.failure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.errorMessageModel?.message ?? "")));
                  } else if (state.verifyForgetPasswordByEmailState ==
                      RequestStatus.loaded) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPasswordScreen()));
                  } else if (state.verifyForgetPasswordByEmailState ==
                      RequestStatus.failure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.errorMessageModel?.message ?? "")));
                  }
                },
                builder: (context, state) {
                  return MainAppButton(
                      isLoading:
                          state.verifyOtpState == RequestStatus.loading ||
                              state.verifyForgetPasswordByEmailState ==
                                  RequestStatus.loading,
                      title: widget.isVerifcation ? "Verify" : "Login",
                      fun: () {
                        if (widget.emailOrPhoneNumber.contains("@") &&
                            widget.isVerifcation == false) {
                          context.read<AuthCubit>().verifySignUp(
                              isEmail: widget.emailOrPhoneNumber.contains("@"),
                              emailOrPhoneNumber: widget.emailOrPhoneNumber,
                              otp: otp);
                        } else if (widget.emailOrPhoneNumber.contains("@") &&
                            widget.isVerifcation) {
                          context.read<AuthCubit>().verifyForgetPassword(
                              email: widget.emailOrPhoneNumber,
                              code: otp,
                              isEmail: widget.emailOrPhoneNumber.contains("@"));
                        } else {
                          context.read<AuthCubit>().loginWithOTP(
                              phoneNumber: widget.emailOrPhoneNumber, otp: otp);
                        }
                      });
                },
              ),
              30.verticalSpace,
              widget.isVerifcation == false
                  ? Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PasswordScreen(
                                  emailOrPhoneNumber: widget.emailOrPhoneNumber,
                                  isPhoneNumber: true,
                                ),
                              ));
                        },
                        child: Text("Use the password instead!",
                            style: AppText.nunitoBold11.copyWith(
                                color: AppColors.blue,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.blue,
                                decorationThickness: 2)),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
