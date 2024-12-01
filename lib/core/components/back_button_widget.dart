import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_home/core/utils/app_colors.dart';

class BackButtonWidget extends StatelessWidget {
  final void Function()? onBack;

  const BackButtonWidget({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onBack ??
          () {
            Navigator.pop(context);
          },
      icon: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.iconblue,
        ),
      ),
    );
  }
}
