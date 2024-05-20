import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabIndexController extends GetxController {
  final RxInt _tabIndex = 0.obs;
  final pageController = PageController();

  int get tabIndex => _tabIndex.value;
  set setTabIndex(int value) => _tabIndex.value = value;

  void onPageChanged(int index) {
    _tabIndex.value = index;
  }

  void onItemTapped(int index) {
    pageController.jumpToPage(index);
  }

}
