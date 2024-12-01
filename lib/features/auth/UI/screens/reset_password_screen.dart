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
import 'package:royal_home/features/auth/UI/screens/login_screen.dart';
import 'package:royal_home/features/auth/cubit/auth_cubit.dart';
import 'package:royal_home/features/auth/cubit/auth_state.dart';

import 'package:royal_home/gen/assets.gen.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                39.verticalSpace,
                Text(
                  "Set your new password so you can login to\n your account.",
                  style:
                      AppText.nunitoRegular16.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
                30.verticalSpace,
                AppTextFeild(
                    validator: combinedPasswordValidator,
                    hint: "enter your password",
                    label: "Password",
                    controller: _newPasswordController),
                10.verticalSpace,
                AppTextFeild(
                    validator: (value) => validatorConfirmPassword(
                        value, _newPasswordController.text),
                    hint: "confirm your password",
                    label: "Confirm new password",
                    controller: _confirmPasswordController),
                90.verticalSpace,
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state.resetPasswordState == RequestStatus.loaded) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false,
                      );
                    } else if (state.resetPasswordState ==
                        RequestStatus.failure) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text(state.errorMessageModel?.message ?? "")));
                    }
                  },
                  builder: (context, state) {
                    return MainAppButton(
                        isLoading:
                            state.resetPasswordState == RequestStatus.loading,
                        title: "Reset password",
                        fun: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().resetPassword(
                                newPassword: _newPasswordController.text,
                                token: state.resetPasswordToken ?? "");
                          }
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
