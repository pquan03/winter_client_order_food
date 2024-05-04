import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:winter_food/common/reusable_text.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/controllers/category_controller.dart';
import 'package:winter_food/models/category.dart';
import 'package:winter_food/views/categories/all_categories.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return InkWell(
      onTap: () {
        if (controller.categoryValue == category.id) {
          controller.updateCategory = '';
          controller.updateTitle = '';
        } else if (category.title == 'More') {
          Get.to(
            () => const AllCategories(),
            transition: Transition.fadeIn,
          );
        } else {
          controller.updateCategory = category.id;
          controller.updateTitle = category.title;
        }
      },
      child: Obx(() {
        final isSelected = controller.categoryValue == category.id;
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
        );
      }),
    );
  }
}
