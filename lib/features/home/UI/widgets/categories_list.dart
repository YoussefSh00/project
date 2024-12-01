import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/text_style.dart';
import 'package:royal_home/features/home/categories/cubit/categories_cubit.dart';
import 'package:royal_home/features/home/categories/cubit/categories_state.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: state.categoriesList?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buildCategoryItem(
                  state.categoriesList![index].name?.en ?? "",
                  state.categoriesList![index].image ?? "");
            });
      },
    );
  }
}

Widget buildCategoryItem(String title, String imagePath) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.w),
    child: Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 75.w,
              height: 75.h,
              decoration: const BoxDecoration(
                color: AppColors.circleColor,
                shape: BoxShape.circle,
              ),
            ),
            Positioned(
              bottom: -8,
              left: 8,
              child: ClipOval(
                child: Image.network(
                  imagePath,
                  width: 60.w,
                  height: 60.h,
                ),
              ),
            ),
          ],
        ),
        8.verticalSpace,
        Text(title, style: AppText.nunitoMedium14),
      ],
    ),
  );
}
