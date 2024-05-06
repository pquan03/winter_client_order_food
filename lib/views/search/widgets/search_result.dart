import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/controllers/search_food_controller.dart';
import 'package:winter_food/views/foods/widgets/food_title.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SearchFoodController.instance;
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 0),
      height: height,
      child: ListView.builder(
        itemCount: controller.foodList.length,
        itemBuilder: (_, index) {
          final food = controller.foodList[index];
          return FoodTile(food: food);
        },
      ),
    );
  }
}
