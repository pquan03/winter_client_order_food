import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:winter_food/constants/uidata.dart';
import 'package:winter_food/controllers/category_controller.dart';
import 'package:winter_food/views/categories/all_categories.dart';
import 'package:winter_food/views/home/widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categories[index];
            return InkWell(
              onTap: () {
                if (controller.categoryValue == category['_id']) {
                  controller.updateCategory = '';
                  controller.updateTitle = '';
                } else if (category['title'] == 'More') {
                  Get.to(
                    () => const AllCategories(),
                    transition: Transition.fadeIn,
                  );
                } else {
                  controller.updateCategory = category['_id'];
                  controller.updateTitle = category['title'];
                }
              },
              child: Obx(
                () {
                  final isSelected =
                      controller.categoryValue == category['_id'];
                  return CategoryItem(
                      isSelected: isSelected, category: category);
                },
              ),
            );
          },
          separatorBuilder: (_, __) {
            return SizedBox(
              width: 16.h,
            );
          },
          itemCount: categories.length),
    );
  }
}
