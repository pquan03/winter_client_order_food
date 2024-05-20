import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:winter_food/common/background_container.dart';
import 'package:winter_food/common/custom_button.dart';
import 'package:winter_food/utils/constants/colors.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:winter_food/controllers/login_controller.dart';
import 'package:winter_food/utils/constants/sizes.dart';
import 'package:winter_food/views/auth/register.dart';
import 'package:winter_food/views/auth/widgets/auth_text_field.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Winter Food Family',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: TColors.primary,
                )),
      ),
      body: BackgroundContainer(
        color: kOffWhite,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Lottie.asset(
              'assets/anime/delivery.json',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: controller.formKey,
                child: Obx(
                  () => Column(children: [
                    AuthTextField(
                      controller: controller.emailController,
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        CupertinoIcons.mail,
                        color: kGray,
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    AuthTextField(
                      controller: controller.passwordController,
                      hintText: 'Enter your password',
                      textInputAction: TextInputAction.done,
                      obscureText: controller.isPasswordVisible.value,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icon(
                        CupertinoIcons.lock_circle,
                        color: kGray,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: controller.togglePasswordVisibility,
                        child: controller.isPasswordVisible.value == true
                            ? Icon(
                                Icons.visibility_off,
                              )
                            : Icon(
                                Icons.visibility,
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/forgot-password');
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: kGray,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const RegisterPage());
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: kPrimary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    CustomButton(
                      height: 40.h,
                      text: 'L O G I N',
                      onTap: controller.login,
                    ),
                  ]),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
