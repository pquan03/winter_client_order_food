import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:winter_food/common/custom_button.dart';
import 'package:winter_food/common/view_full_screen_image.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/controllers/food_detail_controller.dart';
import 'package:winter_food/hooks/restaurant/fetch_restaurant_by_id.dart';
import 'package:winter_food/models/food.dart';
import 'package:winter_food/views/auth/phone_verification.dart';
import 'package:winter_food/views/restaurant/restaurant_page.dart';

class FoodDetail extends HookWidget {
  const FoodDetail({super.key, required this.food});

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurantById(food.restaurant!);
    final controller = Get.put(FoodDetailController());
    controller.loadAdditives(food.additives!);
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: kPrimary,
              width: 1.h,
            ),
            bottom: BorderSide(
              color: kPrimary,
              width: 1.h,
            ),
          ),
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: controller.decrementQuantity,
                    icon: Icon(
                      Ionicons.ios_remove_circle,
                      color: kPrimary,
                      size: 30,
                    ),
                  ),
                  Text(
                    '${controller.quantity.value}',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: controller.incrementQuantity,
                    icon: Icon(
                      Ionicons.ios_add_circle,
                      color: kPrimary,
                      size: 30,
                    ),
                  ),
                ],
              ),
              CustomButton(
                onTap: () {
                  showVertificationPhoneSheet(context);
                },
                text: 'Add to Cart',
                color: kPrimary,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.r),
            ),
            child: SizedBox(
              height: 230.h,
              width: double.infinity,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: food.imageUrl!.length,
                    onPageChanged: controller.changeIndex,
                    itemBuilder: (_, index) {
                      final imageUrl = food.imageUrl![index];
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return PreviewImage(imageUrl: imageUrl);
                              });
                        },
                        child: Container(
                          width: width,
                          height: 230.h,
                          color: kGrayLight,
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  // Page indicator
                  Positioned(
                    bottom: 10.h,
                    left: 10.w,
                    child: Obx(
                      () => Row(
                        children: List.generate(food.imageUrl!.length, (index) {
                          final isActive =
                              controller.currentIndex.value == index;
                          return Container(
                            margin: EdgeInsets.only(right: 5.w),
                            width: 10.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                              color: isActive ? kPrimary : kGrayLight,
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  // Back button
                  Positioned(
                    top: 40.h,
                    left: 10.w,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Ionicons.chevron_back_circle,
                        color: kPrimary,
                        size: 40,
                      ),
                    ),
                  ),
                  // Open Restaurant button
                  Positioned(
                    bottom: 10.h,
                    right: 10.w,
                    child: CustomButton(
                      onTap: () {
                        Get.to(
                            () => RestaurantPage(restaurant: hookResult.data!));
                      },
                      text: 'Open Restaurant',
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Food detail
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(padding: EdgeInsets.only(top: 10.h)),
                  // Food title and price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        food.title!,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Obx(
                        () => Text(
                          '\$ ${((food.price! + controller.additivesTotalPrice.value) * controller.quantity.value).toStringAsFixed(2)}',
                          style: TextStyle(
                            color: kPrimary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Description
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    food.description!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: kGray,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Food Tags
                  SizedBox(
                    height: 20.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: food.foodTags!.length,
                      itemBuilder: (_, index) {
                        final tag = food.foodTags![index];
                        return Container(
                          margin: EdgeInsets.only(right: 10.w),
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Additives/Toppings
                  Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Additives/Toppings title
                        Text(
                          'Additives/Toppings',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        // Additives/Toppings list
                        Column(
                          children:
                              List.generate(food.additives!.length, (index) {
                            final additive = controller.additivesList[index];
                            return CheckboxListTile(
                              value: additive.isChecked.value,
                              activeColor: kPrimary,
                              onChanged: (value) {
                                additive.toggleChecked();
                                // print(controller.getTotalPrice());
                              },
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    additive.title,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '\$ ${additive.price}',
                                    style: TextStyle(
                                      color: kPrimary,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                  // Message to chef
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Message to chef',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Add a note to your chef',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimary,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(width: 1, color: kPrimary),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(width: 1, color: kPrimary),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(width: 1, color: kPrimary),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(padding: EdgeInsets.only(bottom: 20.h)),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> showVertificationPhoneSheet(BuildContext ctx) {
    return showModalBottomSheet(
        context: ctx,
        backgroundColor: Colors.transparent,
        showDragHandle: true,
        builder: (_) {
          return Container(
            height: 500,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/restaurant_bk.png'),
                fit: BoxFit.fill,
              ),
              color: kLightWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  // Title
                  Text(
                    'Verify Your Phone Number',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: kPrimary),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // List Reasons
                  SizedBox(
                      height: 280.h,
                      child: Column(
                        children:
                            List.generate(verificationReasons.length, (index) {
                          final reason = verificationReasons[index];
                          return ListTile(
                            title: Text(
                              reason,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: kGray,
                              ),
                            ),
                            leading: Icon(
                              Ionicons.ios_checkmark_circle,
                              color: kPrimary,
                            ),
                          );
                        }),
                      )),
                  // Button
                  CustomButton(
                    height: 48,
                    onTap: () {
                      Get.to(() => const PhoneVerificationPage());
                    },
                    text: 'Verify Phone Number',
                    color: kPrimary,
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
          );
        });
  }
}
