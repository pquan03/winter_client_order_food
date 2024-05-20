import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:winter_food/common/snackbar_custom.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:winter_food/models/api_error.dart';
import 'package:winter_food/models/food.dart';
import 'package:http/http.dart' as http;

class SearchFoodController extends GetxController {
  // Singleton
  static SearchFoodController get instance => Get.find();

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set isLoading(bool value) => _isLoading.value = value;

  List<FoodModel> foodList = <FoodModel>[].obs;
  final TextEditingController searchController = TextEditingController();

  void searchFoods(String key) async {
    isLoading = true;

    Uri url = Uri.parse('$appBaseUrl/food/search/$key');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        foodList.assignAll(foodModelFromJson(response.body));
      } else {
        final error = apiErrorFromJson(response.body);
        WLoader.errorSnackBar(title: 'Error', message: error.message);
      }
    } catch (err) {
      WLoader.errorSnackBar(title: 'Error', message: err.toString());
    } finally {
      isLoading = false;
    }
  }
}
