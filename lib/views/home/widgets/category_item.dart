import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:winter_food/common/reusable_text.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/models/category.dart';
import 'package:winter_food/views/categories/all_categories.dart';
import 'package:winter_food/views/foods/foods_by_category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (category.value == 'more') {
            Get.to(() => const AllCategories());
          } else {
            Get.to(() => FoodByCategory(
                categoryId: category.id, categoryTitle: category.title));
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Container(
            width: width * 0.19,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage(category.imageUrl),
                  height: 35.h,
                  width: 35.w,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 3,
                ),
                ReusableText(text: category.title)
              ],
            ),
          ),
        ));
  }
}
