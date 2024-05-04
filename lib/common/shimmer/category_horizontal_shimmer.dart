import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends HookWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.grey[300]!, Colors.grey[100]!],
      ),
      child: Container(
        height: 80.h,
        padding: EdgeInsets.only(left: 12.w, top: 10.h),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Container(
                width: 80.w,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.r)),
              );
            },
            separatorBuilder: (_, __) {
              return SizedBox(
                width: 16.h,
              );
            },
            itemCount: 6),
      ),
    );
  }
}
