import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/common/shimmer/category_horizontal_shimmer.dart';
import 'package:winter_food/hooks/category/fetch_categories.dart';
import 'package:winter_food/models/category.dart';
import 'package:winter_food/utils/constants/sizes.dart';
import 'package:winter_food/views/home/widgets/category_item.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CategoryModel>? listCategories = hookResult.data;
    final isLoading = hookResult.isLoading;
    // final error = hookResult.error;
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? CategoryShimmer()
          : ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = listCategories[index];
                return CategoryItem(category: category);
              },
              separatorBuilder: (_, __) {
                return const SizedBox(
                  width: TSizes.spaceBtwItems,
                );
              },
              itemCount: listCategories!.length),
    );
  }
}
