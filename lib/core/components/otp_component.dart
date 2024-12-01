import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpComponent extends StatelessWidget {
  final OtpFieldController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;
  const OtpComponent({
    super.key,
    this.controller,
    this.onChanged,
    this.onCompleted,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OTPTextField(
        controller: controller,
        length: 6,
        width: MediaQuery.of(context).size.width,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldWidth: 40.w,
        fieldStyle: FieldStyle.box,
        style: TextStyle(fontSize: 20.sp),
        onChanged: onChanged ??
            (pin) {
              log("Changed: $pin");
            },
        onCompleted: onCompleted ??
            (pin) {
              log("Completed: $pin");
            },
      ),
    );
  }
}
