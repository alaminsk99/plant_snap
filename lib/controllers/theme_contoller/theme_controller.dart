import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController get instance => Get.find();

  /// Variable
  final _storage = GetStorage();
  final _key = 'isDarkMode';

  ///  this  is observable variable
  final RxBool _isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    _isDarkMode.value = _storage.read(_key) ?? false;
  }

  ThemeMode get theme => _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  /// Function to change theme
  void toggleTheme() {
    _isDarkMode.toggle();
    Get.changeThemeMode(theme);
    _storage.write(_key, _isDarkMode.value);
  }

  bool get isDarkMode => _isDarkMode.value;
}