import 'package:get/get.dart';
import 'package:winter_food/models/additive_obs.dart';
import 'package:winter_food/models/food.dart';

class FoodDetailController extends GetxController {
  // Singleton
  static FoodDetailController get instance => Get.find<FoodDetailController>();

  final currentIndex = 0.obs;
  RxInt quantity = 1.obs;
  RxDouble additivesTotalPrice = 0.0.obs;
  bool initialCheckValue = false;
  var additivesList = <AdditiveObs>[].obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void incrementQuantity() {
    quantity.value++;
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void loadAdditives(List<Additive> additives) {
    additivesList.clear();
    for (var additiveInfo in additives) {
      var additive = AdditiveObs(
        id: additiveInfo.id!,
        title: additiveInfo.title!,
        price: additiveInfo.price!,
        checked: false,
      );
      if (additives.length == additivesList.length) {
      } else {
        additivesList.add(additive);
      }
    }
  }

  List<String> getList() {
    List<String> ads = [];

    for (var additive in additivesList) {
      if (additive.isChecked.value && !ads.contains(additive.title)) {
        ads.add(additive.title);
      } else {
        ads.remove(additive.title);
      }
    }
    return ads;
  }

  double getTotalPrice() {
    double totalPrice = 0;

    for (var additive in additivesList) {
      if (additive.isChecked.value) {
        totalPrice += double.tryParse(additive.price) ?? 0;
      }
    }
    additivesTotalPrice.value = totalPrice;
    return totalPrice;
  }
}
