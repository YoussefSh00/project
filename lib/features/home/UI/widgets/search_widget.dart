import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_home/core/utils/text_style.dart';
import 'package:royal_home/gen/assets.gen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.5,
          ),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            Assets.svgs.search,
            width: 20,
            height: 20,
            color: Colors.grey,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
        ),
        hintText: "Search",
        hintStyle: AppText.nunitoRegular14,
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
      ),
    );
  }
}
