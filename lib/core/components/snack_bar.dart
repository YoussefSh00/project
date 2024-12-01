
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/text_style.dart';

void showSnackBar(
    {required BuildContext buildContext,
    required String message,
    Color color = Colors.transparent}) {
  ScaffoldMessenger.of(buildContext).showSnackBar(SnackBar(
    duration: const Duration(milliseconds: 2500),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    content: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(.8),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x19000000),
            spreadRadius: 2.0,
            blurRadius: 8.0,
            offset: Offset(2, 4),
          )
        ],
        borderRadius: BorderRadius.circular(999.r),
      ),
      child: Center(
        child: Text(message,
            maxLines: 7,
            textAlign: TextAlign.center,
            style: AppText.nunitoBold11.copyWith(
              color: Colors.white,
            )),
      ),
    ),
  ));
}
