import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/text_style.dart';

import 'package:royal_home/gen/assets.gen.dart';



class ChangePasswordDialog extends StatelessWidget {
  const ChangePasswordDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      content: Container(
        width: double.infinity,
        height: 252,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close, size: 18))),
            25.verticalSpace,
            Image.asset(
              Assets.images.checkCircle.path,
              width: 83.w,
              height: 83.h,
            ),
            28.verticalSpace,
            Text(
              "Check your email to receive the reset\n password link",
              style: AppText.nunitoMedium13,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
