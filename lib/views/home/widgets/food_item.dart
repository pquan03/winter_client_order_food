import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:winter_food/common/sizes.dart';
import 'package:winter_food/utils/constants/colors.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:winter_food/models/food.dart';
import 'package:winter_food/views/foods/food_detail.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    super.key,
    required this.food,
  });

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => FoodDetail(food: food));
      },
      child: Container(
        width: width * 0.8,
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: kLightWhite,
          borderRadius: BorderRadius.circular(WSizes.spaceBtwItems.r),
          boxShadow: const [
            BoxShadow(
              color: kGrayLight,
              offset: Offset(0, 2),
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: TColors.dark)),
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
                      Text('Delivery time',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: TColors.darkGrey)),
                      Text(food.time ?? 'N/A',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: TColors.darkGrey)),
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
