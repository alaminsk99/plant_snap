
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plant_snap/screens/auth/login/login_screen.dart';


class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();


  /// Variables
  final deviceStorage = GetStorage();


  /// Called from main.dart on app

  @override
  void onReady() {
   FlutterNativeSplash.remove();
   screenRedirect();

  }

  /// Function to show Relevant Screen
  screenRedirect()async{
    // Local Storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true ? Get.offAll(()=>  LoginScreen()): Get.offAll(LoginScreen());

  }

  /*********************Email & password sign in**********************/

  /// [EmailAuthentication]-Sign-in

  /// [EmailAuthentication]--Resister

  /// [EmailAuthentication]--Re-Authentication

  ///[EmailVerification]- Mail Verification

  /// [EmailAuthentication]--Forget Password

  /*---------------- Delete User------------------------*/

  ///[LogoutUser]- Valid for any authentication

  /// DELETE USER - Remove user Auth and Firebase Account.

}