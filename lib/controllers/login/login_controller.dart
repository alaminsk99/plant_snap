import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plant_snap/common/widgets/loaders/loaders.dart';
import 'package:plant_snap/data/repositories/authentication/authentication_repository.dart';
import 'package:plant_snap/data/services/network_manager.dart';
import 'package:plant_snap/utils/constants/image_strings.dart';
import 'package:plant_snap/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage = GetStorage();
  GlobalKey<FormState> loginFormKey = GlobalKey();



  /// --- Email and Password SignIn
  Future<void> emailAndPasswordSignIn()async{
    try{
      // Start Loading
      PFullScreenLoader.openLoadingDialog("Logging you in...", PImageStrings.docerAnimation);

      // Check Internet  Connectivity
      final isConnected  = await NetworkManager.instance.isConnected();
      if(!isConnected){
        PFullScreenLoader.stopLoading();
        return;
      }

      // Form Validator
      if(!loginFormKey.currentState!.validate()){
        PFullScreenLoader.stopLoading();
        return;
      }

      //Save Data if Remember Me is Selected
      if(rememberMe.value){
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      //Login user using email and password
      final userCredential  = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim(),);

      //Stop the Loader
      PFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch (e){
      // Stop loader
      PFullScreenLoader.stopLoading();
      // Error message
      PLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }finally{
      // Stop loader
      PFullScreenLoader.stopLoading();
    }
  }



}