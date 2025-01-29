import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/common/widgets/loaders/loaders.dart';
import 'package:plant_snap/data/services/network_manager.dart';
import 'package:plant_snap/utils/constants/image_strings.dart';
import 'package:plant_snap/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController{

  static SignupController get instance => Get.find();

  /// Variable
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Signup

  Future<void> signup()async{

    try{

      // Start Loading
      PFullScreenLoader.openLoadingDialog('We are processing your information...', PImageStrings.docerAnimation);


      // Check Internet Connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;


      // Form Validation

      if(!signupFormKey.currentState!.validate()) return;



      // Privacy Policy Check
      if(!privacyPolicy.value){
        PLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In Oder to create account, you must have to read  and accept the Privacy Policy & Terms of Use.'
        );
        return;
      }
      // register user in the Firebase Authentication & Save user data in the firebase

      // Save Authenticated user data in the firebase firestore

      // Show Success Message

      // Move to verify Email Screen


    }catch (e){
      // Show some error
      PLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }finally{
      // remove Loader
      PFullScreenLoader.stopLoading();
    }

  }

}