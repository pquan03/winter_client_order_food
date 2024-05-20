import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:winter_food/common/custom_button.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:winter_food/models/restaurant.dart';
import 'package:winter_food/views/restaurant/widgets/restaurant_expore.dart';
import 'package:winter_food/views/restaurant/widgets/restaurant_menu.dart';
import 'package:winter_food/views/restaurant/widgets/row_text_restaurant.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key, required this.restaurant});

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            // Image background Restaurant
            Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: width,
                  child: CachedNetworkImage(
                    imageUrl: restaurant.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),

                // head action
                Positioned(
                  top: 40.h,
                  child: Container(
                    width: width,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Ionicons.chevron_back_circle,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        // Restaurant name
                        Text(
                          restaurant.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // plane icon
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Ionicons.location_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Star rating
                Positioned(
                  bottom: 0.h,
                  left: 0.w,
                  child: Container(
                    width: width,
                    height: 40.h,
                    color: kPrimary.withOpacity(.3),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Star rating
                        RatingBarIndicator(
                          rating: restaurant.rating / 1.0,
                          itemBuilder: (_, index) => const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          itemCount: 5,
                          itemSize: 25.w,
                        ),
                        // Rating button
                        CustomButton(
                          onTap: () {},
                          text: 'Rate Restaurant',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            //
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                children: [
                  RowTextRestaurant(
                      title: 'Distance To Restaurant', value: '1.182 km'),
                  RowTextRestaurant(
                      title: 'Delivery Price From Current Location',
                      value: '\$ 2.364'),
                  RowTextRestaurant(
                      title: 'Estimated Delivery Time to Current Location',
                      value: '30 mins'),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: kGray.withOpacity(.5),
                    height: 1,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 30.h,
                    width: width,
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: kPrimary,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      labelPadding: EdgeInsets.zero,
                      labelColor: kLightWhite,
                      dividerColor: kLightWhite,
                      tabs: [
                        Tab(
                          child: SizedBox(
                            width: width / 2,
                            height: 30.h,
                            child: Center(
                              child: Text(
                                'Menu',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: width / 2,
                            height: 30.h,
                            child: Center(
                              child: Text(
                                'Explore',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // TabBarView
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: SizedBox(
                      height: height,
                      child: TabBarView(
                        children: [
                          RestaurantMenu(
                            restaurantId: restaurant.id,
                          ),
                          RestaurantExplore(
                            code: restaurant.code,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
