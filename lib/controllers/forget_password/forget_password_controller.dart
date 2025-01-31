


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plant_snap/common/widgets/loaders/loaders.dart';
import 'package:plant_snap/data/repositories/authentication/authentication_repository.dart';
import 'package:plant_snap/data/services/network_manager.dart';
import 'package:plant_snap/screens/auth/password_configuration/reset_password.dart';
import 'package:plant_snap/utils/constants/image_strings.dart';
import 'package:plant_snap/utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();


  /// Variable
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail()async{
    try{
      // Start Loader
      PFullScreenLoader.openLoadingDialog('Processing your request...', PImageStrings.docerAnimation);

      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        PFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        PFullScreenLoader.stopLoading();
        return;
      }

      // Send email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      PFullScreenLoader.stopLoading();

      // success message
      PLoaders.successSnackBar(title: 'Email sent',message: 'Email link sent to reset your password.');

      // Redirect
      Get.to(()=> ResetPassword(email: email.text.trim()));

    }catch (e){
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

  resendPasswordResetEmail(String email)async{
    try{

      // Start Loader
      PFullScreenLoader.openLoadingDialog('Processing your request...', PImageStrings.docerAnimation);

      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        PFullScreenLoader.stopLoading();
        return;
      }

      // Send email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      PFullScreenLoader.stopLoading();

      // success message
      PLoaders.successSnackBar(title: 'Email sent',message: 'Email link sent to reset your password.');


    }catch (e){
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

}