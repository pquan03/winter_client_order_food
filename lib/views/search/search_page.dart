import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:winter_food/common/custom_container.dart';
import 'package:winter_food/common/custom_text_field.dart';
import 'package:winter_food/common/loading_widget.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/controllers/search_food_controller.dart';
import 'package:winter_food/views/search/widgets/search_result.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            toolbarHeight: 75.h,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: CustomTextField(
                  controller: controller.searchController,
                  keyboardType: TextInputType.text,
                  hintText: 'Search For Foods',
                  suffixIcon: GestureDetector(
                      onTap: () {
                        if (controller.foodList.isEmpty) {
                          controller
                              .searchFoods(controller.searchController.text);
                        } else {
                          controller.searchController.clear();
                          controller.foodList.clear();
                        }
                      },
                      child: controller.foodList.isEmpty
                          ? Icon(Ionicons.search_circle,
                              color: kSecondary, size: 40)
                          : Icon(Ionicons.close_circle,
                              color: Colors.red, size: 40))),
            ),
          ),
          body: SafeArea(
              child: CustomContainer(
            containerContent: Container(
                child: controller.isLoading
                    ? LoadingWidget()
                    : controller.foodList.isEmpty
                        ? LoadingWidget()
                        : SearchResult()),
          ))),
    );
  }
}
