import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/constants/uidata.dart';
import 'package:winter_food/views/home/widgets/restaurant_item.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 194.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(restaurants.length, (index) {
            final restaurant = restaurants[index];
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: RestaurantItem(
                  restaurant: restaurant,
                ));
          }),
        ));
  }
}
