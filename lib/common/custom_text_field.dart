import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.keyboardType,
      this.controller,
      this.onEditingComplete,
      this.obsecureText,
      this.suffixIcon,
      this.hintText,
      this.validator});

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final bool? obsecureText;
  final String? hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.h),
      padding: EdgeInsets.only(left: 6.h),
      decoration: BoxDecoration(
          border: Border.all(color: kSecondary, width: 0.4),
          borderRadius: BorderRadius.circular(9.r)),
      child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onEditingComplete: onEditingComplete,
          obscureText: obsecureText ?? false,
          cursorHeight: 20.h,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            border: InputBorder.none,
            suffixIcon: suffixIcon,
          )),
    );
  }
}
