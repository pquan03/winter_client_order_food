import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_food/common/snackbar_custom.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:winter_food/models/api_error.dart';
import 'package:winter_food/models/registration.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  // Singleton
  static RegisterController get instance => Get.find<RegisterController>();

  // Variables
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  // Functions
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> register() async {
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

    if (passwordController.text != confirmPasswordController.text) {
      WLoader.errorSnackBar(title: 'Error', message: 'Passwords do not match');
      return;
    }

    isLoading.value = true;

    Uri url = Uri.parse('$appBaseUrl/auth/register');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    RegistrationModel loginModel = RegistrationModel(
      email: emailController.text,
      username: usernameController.text,
      password: passwordController.text,
    );

    String data = registrationModelToJson(loginModel);

    try {
      var response = await http.post(url, headers: headers, body: data);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        WLoader.successSnackBar(
            title: 'Success', message: 'Registration successful');
        isLoading.value = false;
      } else {
        var error = apiErrorFromJson(response.body);
        WLoader.errorSnackBar(title: 'Error', message: error.message);
      }
    } catch (err) {
      isLoading.value = false;
      WLoader.errorSnackBar(title: 'Error', message: err.toString());
      debugPrint(err.toString());
    }
  }
}
