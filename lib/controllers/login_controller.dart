import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winter_food/common/snackbar_custom.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:winter_food/models/api_error.dart';
import 'package:winter_food/models/login.dart';
import 'package:winter_food/models/login_response.dart';
import 'package:winter_food/views/auth/login.dart';
import 'package:winter_food/views/auth/verification.dart';
import 'package:winter_food/views/entrypoint.dart';

class LoginController extends GetxController {
  // Singleton
  static LoginController get instance => Get.find<LoginController>();

  // Variables
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = true.obs;
  final box = GetStorage();

  // Functions
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      WLoader.errorSnackBar(
          title: 'Error', message: 'Please enter valid details');
      return;
    }

    if (passwordController.text.length < 6 ||
        passwordController.text.length > 18) {
      WLoader.errorSnackBar(
          title: 'Error',
          message: 'Password must be between 6 to 18 characters');
      return;
    }

    isLoading.value = true;

    Uri url = Uri.parse('$appBaseUrl/auth/login');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    LoginModel loginModel = LoginModel(
      email: emailController.text,
      password: passwordController.text,
    );

    String data = loginModelToJson(loginModel);

    try {
      var response = await http.post(url, headers: headers, body: data);

      if (response.statusCode == 200) {
        LoginResponse dataResponse = loginResponseFromJson(response.body);

        String userId = dataResponse.id!;
        String userData = jsonEncode(dataResponse);

        box.write(userId, userData);
        box.write('token', dataResponse.userToken);
        box.write('userId', dataResponse.id);
        box.write('verification', dataResponse.verification);

        isLoading.value = false;

        WLoader.successSnackBar(
            title: 'You are logged in',
            message: 'Welcome back ${dataResponse.username}');

        if (dataResponse.verification == false) {
          Get.offAll(() => const VerificationPage());
        }

        Get.offAll(() => MainScreen());
      } else {
        var error = apiErrorFromJson(response.body);

        WLoader.errorSnackBar(title: 'Error', message: error.message);
      }
    } catch (err) {
      isLoading.value = false;
      debugPrint(err.toString());
    }
  }

  Future<void> logout() async {
    box.erase();
    Get.offAll(() => const LoginPage());
  }

  LoginResponse? getUserInfo() {
    String? userId = box.read('userId');
    String? data;

    if (userId != null) {
      data = box.read(userId.toString());
    }

    if (data != null) {
      return loginResponseFromJson(data);
    }
  }
}
