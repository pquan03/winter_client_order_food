import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:winter_food/common/background_container.dart';
import 'package:winter_food/common/shimmer/restaurant_vertical_shimmer.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/hooks/restaurant/fetch_all_restaurant.dart';
import 'package:winter_food/models/restaurant.dart';
import 'package:winter_food/views/restaurant/widgets/restaurant_tile.dart';

class AllNearbyRestaurants extends HookWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllRestaurants('41007428');
    List<RestaurantModel>? listRestaurants = hookResult.data;
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
        title:
            Text('Nearby Restaurants', style: TextStyle(color: Colors.white)),
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
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: isLoading
              ? RestaurantVerticalShimmer()
              : ListView.separated(
                  itemCount: listRestaurants!.length,
                  separatorBuilder: (_, __) => SizedBox(height: 10.h),
                  itemBuilder: (_, index) {
                    final restaurant = listRestaurants[index];
                    return RestaurantTile(
                      restaurant: restaurant,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
