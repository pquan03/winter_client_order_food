import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/common/shimmer/restaurant_horizontal_shimmer.dart';
import 'package:winter_food/hooks/food/fetch_food.dart';
import 'package:winter_food/models/food.dart';
import 'package:winter_food/views/home/widgets/food_item.dart';

class FoodList extends HookWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoods('41007428');
    List<FoodModel>? listFoods = hookResult.data;
    final isLoading = hookResult.isLoading;
    // final error = hookResult.error;
    return SizedBox(
        height: 194.h,
        child: isLoading
            ? RestaurantHorizontalShimmer()
            : ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(listFoods!.length, (index) {
                  final food = listFoods[index];
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: FoodItem(
                        food: food,
                      ));
                }),
              ));
  }
}
