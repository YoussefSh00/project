import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_home/app.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/text_style.dart';

class OnborardingWidget extends StatelessWidget {
  const OnborardingWidget(
      {super.key, required this.title, required this.subTitle, required this.image});
  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(image),
            48.verticalSpace,
            Text(
              title,
              style: AppText.nunitoBold20
                  .copyWith(color: AppColors.textPrimaryHeavy),
            ),
            16.verticalSpace,
            Text(
              subTitle,
              style: AppText.nunitoRegular14
                  .copyWith(color: AppColors.textPrimaryMedium),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
