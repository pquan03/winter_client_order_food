import 'package:get/get.dart';

class FoodDetailController extends GetxController {
  // Singleton
  static FoodDetailController get instance => Get.find<FoodDetailController>();

  final currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
