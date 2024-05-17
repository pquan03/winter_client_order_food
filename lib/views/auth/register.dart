import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:winter_food/common/background_container.dart';
import 'package:winter_food/common/custom_button.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/controllers/register_controller.dart';
import 'package:winter_food/views/auth/widgets/auth_text_field.dart';

class RegisterPage extends HookWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Winter Food Family',
          style: TextStyle(
            color: kPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BackgroundContainer(
        color: kOffWhite,
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 30.h,
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
                    SizedBox(
                      height: 20.h,
                    ),
                    AuthTextField(
                      controller: controller.usernameController,
                      hintText: 'Enter your username',
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(
                        CupertinoIcons.person,
                        color: kGray,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
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
                    SizedBox(
                      height: 20.h,
                    ),
                    AuthTextField(
                      controller: controller.confirmPasswordController,
                      hintText: 'Enter password again',
                      textInputAction: TextInputAction.done,
                      obscureText: controller.isConfirmPasswordVisible.value,
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
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      height: 40.h,
                      text: 'R E G I S T E R',
                      onTap: controller.register,
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
