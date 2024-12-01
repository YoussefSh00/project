import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/text_style.dart';

class MainAppButton extends StatelessWidget {
  MainAppButton(
      {super.key,
      this.fontsize,
      required this.title,
      required this.fun,
      this.isLoading = false});
  final String title;
  final void Function()? fun;
  final bool? isLoading;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        alignment: Alignment.center,
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: AppColors.black),
        child: isLoading == true
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                title,
                textAlign: TextAlign.center,
                style: AppText.nunitoMedium14.copyWith(
                    color: AppColors.secondaryLight, fontSize: fontsize),
              ),
      ),
    );
  }
}
