import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/common/shimmer/restaurant_horizontal_shimmer.dart';
import 'package:winter_food/hooks/restaurant/fetch_restaurant.dart';
import 'package:winter_food/models/restaurant.dart';
import 'package:winter_food/views/home/widgets/restaurant_item.dart';

class RestaurantList extends HookWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurants('41007428');
    List<RestaurantModel>? listRestaurants = hookResult.data;
    final isLoading = hookResult.isLoading;
    // final error = hookResult.error;
    return SizedBox(
        height: 194.h,
        child: isLoading
            ? RestaurantHorizontalShimmer()
            : ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(listRestaurants!.length, (index) {
                  final restaurant = listRestaurants[index];
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: RestaurantItem(
                        restaurant: restaurant,
                      ));
                }),
              ));
  }
}
