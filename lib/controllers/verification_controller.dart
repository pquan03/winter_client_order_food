import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winter_food/common/snackbar_custom.dart';
import 'package:winter_food/models/login_response.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:winter_food/views/entrypoint.dart';

class VerificationController extends GetxController {
  // Singleton
  static VerificationController get instance => Get.find();
  // Variables
  RxBool isLoading = false.obs;
  String verificationCode = '';
  final box = GetStorage();

  Future<void> verifyWithCode() async {
    Uri url = Uri.parse('$appBaseUrl/user/verify/$verificationCode');

    String accessToken = box.read('token');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    isLoading.value = true;
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        LoginResponse dataResponse = loginResponseFromJson(response.body);

        String userId = dataResponse.id!;
        String userData = jsonEncode(dataResponse);
        // Save data to local storage
        box.write(userId, userData);
        box.write('token', dataResponse.userToken);
        box.write('userId', dataResponse.id);
        box.write('verification', dataResponse.verification);
        // Show success message
        WLoader.successSnackBar(
            title: 'Success', message: 'Verification successful');

        // Navigate to home page
        Get.offAll(() => MainScreen());
      }
    } catch (err) {
      debugPrint(err.toString());
      // WLoader.errorSnackBar(title: 'Error', message: err.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Functions
}
