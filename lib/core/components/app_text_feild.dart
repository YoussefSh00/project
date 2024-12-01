import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_home/core/utils/app_colors.dart';
import 'package:royal_home/core/utils/text_style.dart';

class AppTextFeild extends StatefulWidget {
  const AppTextFeild(
      {super.key,
      required this.hint,
      required this.label,
      this.isPassword = false,
      required this.controller,
      this.validator,
      this.suffix,
      this.padding,
      this.textInputType});

  final String hint;
  final String label;
  final bool isPassword;
  final Widget? suffix;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double? padding;
  final TextInputType? textInputType;

  @override
  State<AppTextFeild> createState() => _AppTextFeildState();
}

class _AppTextFeildState extends State<AppTextFeild> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppText.nunitoMedium14,
        ),
        10.verticalSpace,
        TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          keyboardType: widget.textInputType,
          validator: widget.validator,
          controller: widget.controller,
          obscureText: isHidden && widget.isPassword,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: AppColors.primaryHeavy)),
              hintText: widget.hint,
              hintStyle: AppText.nunitoMedium13
                  .copyWith(color: AppColors.primaryLight),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                      icon: Icon(
                          isHidden ? Icons.visibility_off : Icons.visibility))
                  : null),
        )
      ],
    );
  }
}
