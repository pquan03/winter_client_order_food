import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/common/reusable_text.dart';
import 'package:winter_food/constants/constants.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food});

  final Map<String, dynamic> food;

  @override
  Widget build(BuildContext context) {
    // final isOpen = restaurant['isAvailable'] as bool;
    return GestureDetector(
      onTap: () {},
      child: Container(
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
              child: Stack(
                children: [
                  SizedBox(
                    width: 70.w,
                    height: 70.h,
                    child: Image.network(
                      food['imageUrl'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 0.w,
                    bottom: 0.h,
                    child: Container(
                      alignment: Alignment.center,
                      height: 16.h,
                      width: 70.w,
                      decoration:
                          BoxDecoration(color: kGrayLight.withOpacity(0.5)),
                      child: RatingBarIndicator(
                        rating: food['rating'] / 1.0,
                        itemBuilder: (_, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 12.w,
                      ),
                    ),
                  )
                ],
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
                        ReusableText(text: food['title']),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.w),
                              child: Container(
                                alignment: Alignment.center,
                                color: kSecondary,
                                padding: EdgeInsets.all(3.w),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                  size: 12.w,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: kPrimary,
                                    borderRadius: BorderRadius.circular(50.w)),
                                child: Text(
                                  '\$ ${food['price']}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    // Delivery time
                    ReusableText(
                      text: 'Delivery time ${food['time']}',
                      color: kGray,
                      fontSize: 10.sp,
                    ),
                    // food tags
                    SizedBox(
                      height: 20.h,
                      width: double.infinity,
                      child: ListView.separated(
                        itemCount: (food['foodTags'] as List).length,
                        separatorBuilder: (_, __) => const SizedBox(
                          width: 5,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          final foodTag = food['foodTags'][index];
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: kSecondary,
                                  borderRadius: BorderRadius.circular(5.w)),
                              child: Text(
                                foodTag,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
