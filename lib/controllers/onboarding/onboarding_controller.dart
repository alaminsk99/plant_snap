
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plant_snap/screens/auth/login/login_screen.dart';

class OnBoardingController extends GetxController{

  static OnBoardingController get instance => Get.find();

  /// Update the current index & Jump to next page
  void nextPage(){
    final storage = GetStorage();
    storage.write('IsFirstTime', false);
    Get.offAll(LoginScreen());
  }


}