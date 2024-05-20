import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/common/sizes.dart';
import 'package:winter_food/utils/constants/colors.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:winter_food/utils/constants/sizes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: WSizes.spaceBtwItems),
      height: 110.h,
      width: width,
      color: TColors.primary,
      child: Container(
        margin: EdgeInsets.only(
            top: TSizes.defaultSpace, bottom: TSizes.defaultSpace * 0.3),
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
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: TColors.secondary),
                      ),
                      SizedBox(
                          width: width * 0.65,
                          child: Text('203 W 23rd St, New York, NY 10011',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: TColors.textWhite)))
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
