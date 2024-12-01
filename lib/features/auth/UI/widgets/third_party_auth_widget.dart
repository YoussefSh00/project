import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/text_style.dart';

class ThirdPartyAuthWidget extends StatelessWidget {
  const ThirdPartyAuthWidget(
      {super.key, required this.assetName, required this.text});
  final String assetName;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 300.w,
      height: 50.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryHeavy2),
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(assetName),
          8.horizontalSpace,
          Text(
            text,
            style: AppText.nunitoSemiBold16,
          )
        ],
      ),
    );
  }
}
