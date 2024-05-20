import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:winter_food/common/shimmer/restaurant_horizontal_shimmer.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:winter_food/hooks/food/fetch_food.dart';
import 'package:winter_food/views/foods/widgets/food_title.dart';

class RestaurantExplore extends HookWidget {
  const RestaurantExplore({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoods(code);
    final foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    return SizedBox(
      height: height * 0.7,
      child: isLoading
          ? RestaurantHorizontalShimmer()
          : ListView(
              padding: EdgeInsets.zero,
              children: List.generate(foods.length, (index) {
                final food = foods[index];
                return FoodTile(food: food);
              }),
            ),
    );
  }
}
