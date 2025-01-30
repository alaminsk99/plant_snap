import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/common/widgets/loaders/loaders.dart';
import 'package:plant_snap/data/repositories/authentication/authentication_repository.dart';
import 'package:plant_snap/data/repositories/user/user_repository.dart';
import 'package:plant_snap/data/services/network_manager.dart';
import 'package:plant_snap/models/user_model.dart';
import 'package:plant_snap/screens/auth/signup/verify_email.dart';
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

  void signup()async{

    try{

      // Start Loading
      PFullScreenLoader.openLoadingDialog('We are processing your information...', PImageStrings.docerAnimation);


      // Check Internet Connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        // Remove Loader
        return;
      }


      // Form Validation

      if(!signupFormKey.currentState!.validate()){
        // Remove Loader
        return;
      }



      // Privacy Policy Check
      if(!privacyPolicy.value){
        PLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In Oder to create account, you must have to read  and accept the Privacy Policy & Terms of Use.'
        );
        return;
      }
      // register user in the Firebase Authentication & Save user data in the firebase

      final userCredential = await AuthenticationRepository.instance.registerEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data in the firebase firestore

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveDataRecord(newUser);

      // Remove the loader
      PFullScreenLoader.stopLoading();

      // Show Success Message
      PLoaders.successSnackBar(title: 'Congratulation', message: 'Your account has been created! Verify email to continue.');

      // Move to verify Email Screen
      await Get.to(()=>  VerifyEmailScreen(email: email.text.trim(),));

    }catch (e){
      PFullScreenLoader.stopLoading();
      // Show some error
      PLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }finally{
      // remove Loader
      // PFullScreenLoader.stopLoading();
    }

  }




}