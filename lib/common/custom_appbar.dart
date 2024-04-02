import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 110.h,
      width: width,
      color: kOffWhite,
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: kSecondary,
                  backgroundImage: const NetworkImage(
                      'https://d326fntlu7tb1e.cloudfront.net/uploads/4a4cd06e-94de-4478-8588-66eee01354d4-rice.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h, bottom: 6.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deliver to',
                        style: TextStyle(
                          color: kSecondary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.65,
                        child: Text('203 W 23rd St, New York, NY 10011',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12.sp,
                                color: kGrayLight)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Text(getTimeOfDay(),
                style: TextStyle(
                    color: kSecondary,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    shadows: const [
                      BoxShadow(
                          color: kGrayLight,
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          spreadRadius: 0.5)
                    ])),
          ],
        ),
      ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return '🌞';
    } else if (hour >= 12 && hour < 16) {
      return '🌥️';
    } else {
      return '🌙';
    }
  }
}
