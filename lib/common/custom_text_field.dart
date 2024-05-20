import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/utils/constants/colors.dart';

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
      child: TextFormField(
          style: TextStyle(
            color: TColors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
          controller: controller,
          keyboardType: keyboardType,
          onEditingComplete: onEditingComplete,
          obscureText: obsecureText ?? false,
          cursorHeight: 20.h,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          )),
    );
  }
}
