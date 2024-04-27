import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/constants/uidata.dart';
import 'package:winter_food/views/home/widgets/food_item.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 194.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(foods.length, (index) {
            final food = foods[index];
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: FoodItem(
                  food: food,
                ));
          }),
        ));
  }
}
