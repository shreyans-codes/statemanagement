import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController {
  bool isDarkTheme = false;
  SharedPreferences preferences;
  checkTheme() async {
    if (preferences==null){
      preferences = await SharedPreferences.getInstance();
    }
    isDarkTheme = preferences.getBool('isDarkTheme');
    if (isDarkTheme == null) {
      Get.changeTheme(ThemeData.light());
      isDarkTheme = false;
    }
    switch (isDarkTheme) {
      case true:
        Get.changeTheme(ThemeData.dark());
        break;
        case false:
        Get.changeTheme(ThemeData.light());
        break;
      default: Get.snackbar("Error", "An unexpected error occured. Please retry");
    }
    print(isDarkTheme);
    update();
  }

  @override
  void onInit() {
    checkTheme();
    print("Hello");
    super.onInit();
  }

  void toggleTheme() async {
    isDarkTheme = !isDarkTheme;
    preferences.setBool('isDarkTheme', isDarkTheme);
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  }
}
