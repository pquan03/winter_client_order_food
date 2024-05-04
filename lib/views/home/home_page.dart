// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:winter_food/common/custom_appbar.dart';
import 'package:winter_food/common/custom_container.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/views/foods/the_fastest_food.dart';
import 'package:winter_food/views/foods/try_food_new.dart';
import 'package:winter_food/views/home/widgets/category_list.dart';
import 'package:winter_food/views/home/widgets/food_list.dart';
import 'package:winter_food/views/home/widgets/heading_section.dart';
import 'package:winter_food/views/home/widgets/restaurant_list.dart';
import 'package:winter_food/views/restaurant/all_nearby_restaurant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(130.h), child: const CustomAppBar()),
        body: SafeArea(
            child: CustomContainer(
                containerContent: Column(
          children: [
            // Category List
            CategoryList(),
            const SizedBox(
              height: 10,
            ),
            // Nearby Restaurants
            HeadingSection(
              title: 'Nearby Restaurants',
              onTap: () => Get.to(() => const AllNearbyRestaurants()),
            ),
            const SizedBox(
              height: 10,
            ),
            RestaurantList(),
            const SizedBox(
              height: 10,
            ),
            // Try Something New
            HeadingSection(
              title: 'Try Something New',
              onTap: () => Get.to(() => const TryFoodNew()),
            ),
            const SizedBox(
              height: 10,
            ),
            FoodList(),
            const SizedBox(
              height: 10,
            ),
            //Fastest food closer to you
            HeadingSection(
              title: 'Fastest food closer to you',
              onTap: () => Get.to(() => const TheFastestFood()),
            ),
            const SizedBox(
              height: 10,
            ),
            FoodList(),
          ],
        ))));
  }
}
