import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/common/shimmer_custom.dart';
import 'package:winter_food/constants/constants.dart';


class RestaurantVerticalShimmer extends HookWidget {
  const RestaurantVerticalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerCustom(
      child: ListView.separated(
        itemCount: 6,
        separatorBuilder: (_, __) => SizedBox(height: 10.h),
        itemBuilder: (_, index) {
          return Container(
            clipBehavior: Clip.hardEdge,
            height: 70.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: kGrayLight.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(8.w))),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.w),
                  child: SizedBox(
                    width: 70.w,
                    height: 70.h,
                    child: Container(
                      color: kGrayLight,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.h, bottom: 5.h, right: 5.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name and state
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 150.w,
                              height: 10.h,
                              color: kGrayLight,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 50.w,
                                  height: 10.h,
                                  color: kGrayLight,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 50.w,
                                  height: 10.h,
                                  color: kGrayLight,
                                ),
                              ],
                            )
                          ],
                        ),
                        // Delivery time
                        Container(
                          width: 100.w,
                          height: 10.h,
                          color: kGrayLight,
                        ),
                        // Address
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
