// import 'package:amazon_warehouse/core/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DotsIndicator extends StatelessWidget {
//   const DotsIndicator({
//     super.key,
//     required int currentIndex,
//   }) : _currentIndex = currentIndex;

//   final int _currentIndex;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(
     
//         (index) => Container(
//           margin: EdgeInsets.symmetric(horizontal: 3.w),
//           width: 8.0.w,
//           height: 8.0.h,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: _currentIndex == index
//                 ? AppColors.primaryColor900
//                 : AppColors.primaryColor900.withOpacity(0.3),
//           ),
//         ),
//       ),
//     );
//   }
// }
