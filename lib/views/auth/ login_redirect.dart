import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:winter_food/common/custom_button.dart';
import 'package:winter_food/utils/constants/colors.dart';
import 'package:winter_food/views/auth/login.dart';

class LoginRedirect extends StatelessWidget {
  const LoginRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
        title: Text(
          'Please login to access this page',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: TColors.secondary),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/anime/delivery.json',
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(
              height: 40.h,
              text: 'L O G I N',
              onTap: () => Get.to(() => const LoginPage()),
            ),
          ),
        ],
      ),
    );
  }
}
