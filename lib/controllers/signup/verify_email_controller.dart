import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/common/widgets/loaders/loaders.dart';
import 'package:plant_snap/common/widgets/success_screen/success_screen.dart';
import 'package:plant_snap/data/repositories/authentication/authentication_repository.dart';
import 'package:plant_snap/utils/constants/image_strings.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';



class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link
  sendEmailVerification()async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      PLoaders.successSnackBar(title: 'Email sent',message: 'Please check your inbox and verify  your email.');
    }catch (e){
      PLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }

  /// Timer to automatically  on Email Verification
  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(
            () => SuccessScreen(
            image: PImageStrings.successfullyRegisterAnimation,
            title: PTextStrings.yourAccountCreatedTitle,
            subTitle: PTextStrings.yourAccountCreatedSubTitle,
            onPressed: ()=> AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }
  /// Manually Check if Email  Verified

  checkEmailVerificationStatus()async{
    final currentUser =  FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(
          ()=> SuccessScreen(
            image: PImageStrings.successfullyRegisterAnimation,
            title: PTextStrings.yourAccountCreatedTitle,
            subTitle: PTextStrings.yourAccountCreatedSubTitle,
            onPressed: ()=> AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}