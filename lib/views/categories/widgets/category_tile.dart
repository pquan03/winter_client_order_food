import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:winter_food/views/categories/category_page.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
  });

  final dynamic category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(
            () => CategoryPage(
                  title: category['title'],
                ),
            transition: Transition.fadeIn);
      },
      leading: CircleAvatar(
        radius: 20.r,
        backgroundImage: NetworkImage(category['imageUrl']),
      ),
      title: Text(category['title']),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
