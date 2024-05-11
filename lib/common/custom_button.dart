import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      this.width,
      this.height,
      this.color,
      this.borderRadius,
      required this.text});

  final void Function()? onTap;
  final double? width;
  final double? height;
  final Color? color;
  final double? borderRadius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            width: width,
            height: height ?? 28.h,
            decoration: BoxDecoration(
              color: color ?? kPrimary,
              borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )));
  }
}
