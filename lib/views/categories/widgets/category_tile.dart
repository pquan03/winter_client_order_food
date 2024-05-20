import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:winter_food/models/category.dart';
import 'package:winter_food/utils/constants/colors.dart';
import 'package:winter_food/views/foods/foods_by_category.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => FoodByCategory(
            categoryId: category.id, categoryTitle: category.title));
      },
      leading: CircleAvatar(
        radius: 20.r,
        backgroundImage: NetworkImage(category.imageUrl),
      ),
      title:
          Text(category.title, style: Theme.of(context).textTheme.bodyMedium),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: TColors.darkGrey,
      ),
    );
  }
}
