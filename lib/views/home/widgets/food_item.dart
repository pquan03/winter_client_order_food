import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winter_food/common/sizes.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/models/food.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    super.key,
    required this.food,
  });

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.8,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: kLightWhite,
        borderRadius: BorderRadius.circular(WSizes.spaceBtwItems.r),
        boxShadow: [
          BoxShadow(
            color: kGrayLight,
            offset: const Offset(0, 2),
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: SizedBox(
                height: 112.h,
                width: double.infinity,
                child: Image.network(
                  food.imageUrl!.first,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(food.title!,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                    Text(
                      '\$ ${food.price}',
                      style: TextStyle(
                          color: kPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Delivery time',
                        style: TextStyle(
                            fontSize: 12,
                            color: kGray,
                            fontWeight: FontWeight.w500)),
                    Text(food.time ?? 'N/A',
                        style: TextStyle(
                            fontSize: 12,
                            color: kGray,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
