import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_home/core/components/back_button_widget.dart';
import 'package:royal_home/core/utils/text_style.dart';
import 'package:royal_home/gen/assets.gen.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({
    Widget? leadingWidget,
    Widget? bottomWidget,
    super.key,
    super.actions,
    super.centerTitle = true,
    void Function()? onBack,
  }) : super(
          shadowColor: Colors.transparent,
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          leadingWidth: 70.w,
          title: Image.asset(
            Assets.images.appLogo.path,
            width: 38.w,
            height: 38.h,
          ),
          automaticallyImplyLeading: false,
          leading: leadingWidget ?? BackButtonWidget(onBack: onBack),
          bottom: bottomWidget == null
              ? null
              : PreferredSize(
                  preferredSize: Size.fromHeight(43.h),
                  child: bottomWidget,
                ),
        );
}
