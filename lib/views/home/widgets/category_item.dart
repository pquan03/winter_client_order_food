import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/common/reusable_text.dart';
import 'package:winter_food/constants/constants.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.isSelected,
    this.category,
  });

  final bool isSelected;
  final dynamic category;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        width: width * 0.19,
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected ? kSecondary : kOffWhite, width: .5.w),
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(category['imageUrl']),
              height: 35.h,
              width: 35.w,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 3,
            ),
            ReusableText(text: category['title'])
          ],
        ),
      ),
    );
  }
}
