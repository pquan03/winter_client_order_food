import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/common/background_container.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/constants/uidata.dart';
import 'package:winter_food/views/foods/widgets/food_title.dart';

class TheFastestFood extends StatelessWidget {
  const TheFastestFood({super.key});

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
        title: Text(
          'Fastest Food Closer to You',
          style: TextStyle(color: Colors.white),
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
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: ListView.separated(
            itemCount: foods.length,
            separatorBuilder: (_, __) => SizedBox(height: 10.h),
            itemBuilder: (_, index) {
              final food = foods[index];
              // return FoodTile(
              //   food: food,
              // );
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
