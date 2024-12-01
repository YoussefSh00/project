import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/text_style.dart';
import 'package:royal_home/features/home/products/cubit/products_cubit.dart';
import 'package:royal_home/features/home/products/cubit/products_state.dart';
import 'package:royal_home/gen/assets.gen.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({
    super.key, required this.sortBy,
  });
final String sortBy;
  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts(widget.sortBy);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          itemCount: state.productsList?.length ?? 0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 290,
              childAspectRatio: 0.9),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderPrimaryHeavy),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        state.productsList?[index].coverPictureUrl ?? "",
                        width: double.infinity,
                        height: 150.h,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            Assets.images.appLogo.path,
                            width: 102.w,
                            height: 100.h,
                          );
                        },
                      ),
                      Positioned(
                        right: 0,
                        child: Icon(
                          state.productsList?[index].isWishListed ?? false
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: AppColors.textPrimaryAccentHeavy,
                          size: 24.sp,
                        ),
                      )
                    ],
                  ),
                  8.verticalSpace,
                  Text(
                    state.productsList?[index].name?.en ?? "",
                    style: AppText.nunitoMedium14,
                  ),
                  8.verticalSpace,
                  Text(
                    "\$ ${state.productsList?[index].price.toString() ?? ""} ",
                    style: AppText.nunitoMedium14
                        .copyWith(color: AppColors.textPrimaryAccentHeavy),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
