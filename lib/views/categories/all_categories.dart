import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:winter_food/common/background_container.dart';
import 'package:winter_food/common/shimmer/category_vertical_shimmer.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/hooks/category/fetch_all_categories.dart';
import 'package:winter_food/models/category.dart';
import 'package:winter_food/views/categories/widgets/category_tile.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllCategories();
    List<CategoryModel>? listCategories = hookResult.data;
    final isLoading = hookResult.isLoading;
    // final error = hookResult.error;
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
      ),
      body: BackgroundContainer(
        color: kOffWhite,
        child: isLoading
            ? CategoryVerticalShimmer()
            : ListView.builder(
                itemCount: listCategories!.length,
                itemBuilder: (_, index) {
                  final category = listCategories[index];
                  return CategoryTile(category: category);
                },
              ),
      ),
    );
  }
}
