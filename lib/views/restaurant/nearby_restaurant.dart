import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/common/background_container.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/constants/uidata.dart';
import 'package:winter_food/views/restaurant/widgets/restaurant_tile.dart';

class NearbyRestaurants extends StatelessWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
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
            Navigator.pop(context);
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
          child: ListView.separated(
            itemCount: restaurants.length,
            separatorBuilder: (_, __) => SizedBox(height: 10.h),
            itemBuilder: (_, index) {
              final restaurant = restaurants[index];
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
