import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController {
  late Future<bool?> isDarkTheme;
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  checkTheme() async {
    final SharedPreferences pref = await preferences;
    final bool? darkTheme = await isDarkTheme;
    isDarkTheme = pref.setBool('isDarkTheme', darkTheme!).then((bool success) {
      return darkTheme;
    });
    switch (darkTheme) {
      case true:
        Get.changeTheme(ThemeData.dark());
        break;
      case false:
        Get.changeTheme(ThemeData.light());
        break;
      default:
        Get.snackbar("Error", "An unexpected error occured. Please retry");
    }
    print(isDarkTheme);
    update();
  }

  @override
  void onInit() async {
    isDarkTheme = preferences.then((SharedPreferences pref) {
      return pref.getBool('isDarkTheme') ?? false;
    });
    final bool? darkTheme = await isDarkTheme;
    print(darkTheme);
    checkTheme();
    print("Hello");
    super.onInit();
  }

  void toggleTheme() async {
    bool? darkTheme = await isDarkTheme;
    // print(darkTheme);
    if (darkTheme!)
      darkTheme = false;
    else
      darkTheme = true;
    final SharedPreferences pref = await preferences;
    isDarkTheme = pref.setBool('isDarkTheme', darkTheme!).then((bool success) {
      return darkTheme;
    });
    Get.changeTheme(darkTheme ? ThemeData.light() : ThemeData.dark());
  }
}
