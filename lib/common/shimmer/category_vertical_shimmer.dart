import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/common/shimmer_custom.dart';

class CategoryVerticalShimmer extends StatelessWidget {
  const CategoryVerticalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerCustom(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (_, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.grey[300],
            ),
            title: Container(
              height: 10.h,
              color: Colors.grey[300],
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}
