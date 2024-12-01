import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/text_style.dart';
import 'package:royal_home/features/home/categories/cubit/categories_cubit.dart';
import 'package:royal_home/features/home/UI/widgets/categories_list.dart';
import 'package:royal_home/features/home/UI/widgets/products_list.dart';
import 'package:royal_home/features/home/UI/widgets/search_widget.dart';
import 'package:royal_home/features/main_nav/main_navigation_screen.dart';
import 'package:royal_home/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            20.verticalSpace,
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      scaffoldKey.currentState?.openDrawer();
                      setState(() {});
                    },
                    child: const Icon(Icons.menu)),
                20.horizontalSpace,
                const Expanded(child: SearchWidget()),
                20.horizontalSpace,
                SvgPicture.asset(Assets.svgs.notification)
              ],
            ),
            20.verticalSpace,
            SizedBox(
              width: double.infinity,
              height: 170.h,
              child: Image.asset(Assets.images.offerHome.path),
            ),
            20.verticalSpace,
            Align(
                alignment: Alignment.topLeft,
                child: Text("Categories", style: AppText.nunitoSemiBold18)),
            12.verticalSpace,
            SizedBox(
              height: 110.h,
              child: const CategoriesList(),
            ),
            28.verticalSpace,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Best Seller",
                style: AppText.nunitoSemiBold16
                    .copyWith(color: AppColors.textPrimaryAccentHeavy),
              ),
            ),
            const ProductsList(
              sortBy: "BEST_SELLING",
            ),
            20.verticalSpace,
            SizedBox(
              width: double.infinity,
              height: 170.h,
              child: Image.asset(Assets.images.offerHome.path),
            ),
            20.verticalSpace,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Most popular",
                style: AppText.nunitoSemiBold16,
              ),
            ),
            const ProductsList(
              sortBy: "BEST_SELLING",
            ),
            32.verticalSpace,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "New arrivals",
                style: AppText.nunitoSemiBold16,
              ),
            ),
            const ProductsList(
              sortBy: "NEW_ARRIVALS",
            ),
          ],
        ),
      ),
    );
  }
}
