import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController();
  int selectedIndex = 0;

  updateIndex(index) {
    selectedIndex = index;
    update();
  }
}
