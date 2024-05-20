import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/utils/constants/constants.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.obscureText = false, 
      this.initialValue,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon});

  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String? initialValue;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      textInputAction: textInputAction,
      keyboardType: TextInputType.emailAddress,
      initialValue: initialValue,
      obscureText: obscureText,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is required';
        } else {
          return null;
        }
      },
      style: TextStyle(
        color: kGray,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: kGray,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kRed, width: 0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kRed, width: 0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimary, width: 0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimary, width: 0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kGrayLight, width: 0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}
