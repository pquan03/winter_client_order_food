import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/constants/constants.dart';

class ReusableText extends StatelessWidget {
  const ReusableText(
      {super.key, required this.text, this.color = kDark, this.fontSize});

  final String text;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      text,
      style: TextStyle(
          fontSize: fontSize ?? 12.h,
          color: color,
          fontWeight: FontWeight.normal),
    );
  }
}
