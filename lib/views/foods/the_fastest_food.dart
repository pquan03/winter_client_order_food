import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:winter_food/common/background_container.dart';
import 'package:winter_food/common/shimmer/restaurant_vertical_shimmer.dart';
import 'package:winter_food/utils/constants/colors.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:winter_food/hooks/food/fetch_all_food.dart';
import 'package:winter_food/models/food.dart';
import 'package:winter_food/views/foods/widgets/food_title.dart';

class TheFastestFood extends HookWidget {
  const TheFastestFood({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllFoods('41007428');
    List<FoodModel>? listFoods = hookResult.data;
    final isLoading = hookResult.isLoading;
    // final error = hookResult.error;
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: kSecondary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Fastest Food Closer to You',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: TColors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.qr_code,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: BackgroundContainer(
        color: TColors.white,
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: isLoading
              ? RestaurantVerticalShimmer()
              : ListView.separated(
                  itemCount: listFoods!.length,
                  separatorBuilder: (_, __) => SizedBox(height: 10.h),
                  itemBuilder: (_, index) {
                    final food = listFoods[index];
                    return FoodTile(
                      food: food,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
