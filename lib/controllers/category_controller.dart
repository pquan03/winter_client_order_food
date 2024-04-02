// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxString _category = ''.obs;
  RxString _title = ''.obs;

  String get categoryValue => _category.value;
  String get titleValue => _title.value;

  set updateCategory(String value) => _category.value = value;
  set updateTitle(String value) => _title.value = value;
}
