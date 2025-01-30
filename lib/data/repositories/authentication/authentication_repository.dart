
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plant_snap/common/exceptions/p_firebase_auth_exception.dart';
import 'package:plant_snap/common/exceptions/p_format_exception.dart';
import 'package:plant_snap/common/exceptions/p_platform_exception.dart';
import 'package:plant_snap/screens/auth/login/login_screen.dart';
import 'package:plant_snap/screens/auth/onboarding/onboarding.dart';


class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();


  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;


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
    deviceStorage.read('IsFirstTime') != true ? Get.offAll(()=>   LoginScreen()): Get.offAll(const OnboardingScreen());

  }

  /*********************Email & password sign in**********************/

  /// [EmailAuthentication]-Sign-in

  /// [EmailAuthentication]--Resister

  Future<UserCredential> registerEmailAndPassword(String email,String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e){
      throw PFirebaseAuthException(e.code).message;
    } on FormatException catch (_){
      throw const PFormatException();
    }on PlatformException catch (e){
      throw PPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication]--Re-Authentication

  ///[EmailVerification]- Mail Verification

  /// [EmailAuthentication]--Forget Password

  /*---------------- Delete User------------------------*/

  ///[LogoutUser]- Valid for any authentication

  /// DELETE USER - Remove user Auth and Firebase Account.

}