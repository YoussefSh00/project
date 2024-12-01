import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_home/core/components/app_bar_widget.dart';
import 'package:royal_home/core/components/app_text_feild.dart';
import 'package:royal_home/core/components/main_app_button.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/status.dart';
import 'package:royal_home/core/utils/text_style.dart';
import 'package:royal_home/core/utils/validator.dart';
import 'package:royal_home/features/auth/UI/screens/otp_screen.dart';
import 'package:royal_home/features/auth/cubit/auth_cubit.dart';
import 'package:royal_home/features/auth/cubit/auth_state.dart';

import 'package:royal_home/gen/assets.gen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cofirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  39.verticalSpace,
                  Text(
                    "Please enter main details",
                    style: AppText.nunitoRegular16
                        .copyWith(color: AppColors.black),
                  ),
                  30.verticalSpace,
                  AppTextFeild(
                      validator: validatorName,
                      hint: "enter your first name",
                      label: "First name",
                      controller: _firstNameController),
                  10.verticalSpace,
                  AppTextFeild(
                      validator: validatorName,
                      hint: "enter your last name",
                      label: "Last name",
                      controller: _lastNameController),
                  10.verticalSpace,
                  AppTextFeild(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your email or phone number";
                        }
                        return null;
                      },
                      hint: "enter your email or phone number",
                      label: "Email / Phone number",
                      controller: _emailController),
                  10.verticalSpace,
                  AppTextFeild(
                      validator: combinedPasswordValidator,
                      hint: "enter your new password",
                      label: "Password",
                      controller: _passwordController),
                  10.verticalSpace,
                  AppTextFeild(
                      validator: (value) => validatorConfirmPassword(
                          value, _passwordController.text),
                      hint: "confirm your password",
                      label: "Confirm Password",
                      controller: _cofirmPasswordController),
                  20.verticalSpace,
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state.signupState == RequestStatus.loaded) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPScreen(
                                      isVerifcation: false,
                                      emailOrPhoneNumber: _emailController.text,
                                    )));
                      } else if (state.signupState == RequestStatus.failure) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text(state.errorMessageModel?.message ?? "")));
                      }
                    },
                    builder: (context, state) {
                      return MainAppButton(
                          title: "Signup",
                          isLoading: state.signupState == RequestStatus.loading,
                          fun: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthCubit>().signUp(
                                  emailOrPhoneNumber: _emailController.text,
                                  password: _passwordController.text,
                                  isEmail: _emailController.text.contains("@"),
                                  lastName: _lastNameController.text,
                                  firstName: _firstNameController.text);
                            }
                          });
                    },
                  ),
                  40.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
