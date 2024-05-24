import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:winter_food/common/custom_button.dart';
import 'package:winter_food/controllers/verification_controller.dart';
import 'package:winter_food/utils/constants/colors.dart';
import 'package:winter_food/utils/constants/sizes.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Please verify your account',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: TColors.secondary),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Lottie.asset(
            'assets/anime/delivery.json',
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify Your Account',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: TColors.primary),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Text(
                  'Enter the 6-digit code sent to your email address. if you don\'t see the code, please check your spam folder.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: TColors.darkGrey),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: TColors.primary,
                  borderWidth: 2.0,
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: TColors.dark),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here if necessary
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.verificationCode = verificationCode;
                  },
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                CustomButton(
                  text: 'V E R I F Y  A C C O U N T',
                  height: 40.h,
                  onTap: controller.verifyWithCode,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
