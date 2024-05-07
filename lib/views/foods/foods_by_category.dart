import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/hooks/food/fetch_food_by_category.dart';
import 'package:winter_food/models/food.dart';
import 'package:winter_food/views/foods/widgets/food_title.dart';

class FoodByCategory extends HookWidget {
  const FoodByCategory(
      {super.key, required this.categoryId, required this.categoryTitle});

  final String categoryId;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoodsByCategory(categoryId, '41007428');
    List<FoodModel>? listFoods = hookResult.data;
    final isLoading = hookResult.isLoading;
    // final error = hookResult.error;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 12.h, left: 10.w, right: 10.w),
          child: isLoading
              ? CircularProgressIndicator()
              : listFoods!.isEmpty
                  ? Center(
                      child: Text('No food available in this category'),
                    )
                  : ListView.builder(
                      itemCount: listFoods.length,
                      itemBuilder: (_, index) {
                        final food = listFoods[index];
                        return FoodTile(food: food);
                      },
                    )),
    );
  }
}
