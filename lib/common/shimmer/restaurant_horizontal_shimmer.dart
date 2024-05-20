import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/common/shimmer_custom.dart';
import 'package:winter_food/utils/constants/constants.dart';


class RestaurantHorizontalShimmer extends HookWidget {
  const RestaurantHorizontalShimmer({super.key});

  @override
  Widget build(BuildContext context) {    
    return ShimmerCustom(
      child: SizedBox(
          height: 194.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(3, (index) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: SizedBox(
                    width: width * 0.8,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: SizedBox(
                                  height: 112.h,
                                  width: double.infinity,
                                  child: Container(
                                    color: kGrayLight,
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 10.h,
                                  right: 10.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.r),
                                    child: Container(
                                      color: kLightWhite,
                                      child: Padding(
                                        padding: EdgeInsets.all(2.h),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(50.r),
                                          child: Container(
                                            color: kGrayLight,
                                            width: 20.w,
                                            height: 20.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: kGrayLight,
                                height: 10.h,
                                width: 100.w,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                color: kGrayLight,
                                height: 10.h,
                                width: 50.w,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                color: kGrayLight,
                                height: 10.h,
                                width: 100.w,
                              ),
                            ],
                          ),
                        ))
                      ],
                    )
                  ));
            }),
          )),
    );
  }
}

