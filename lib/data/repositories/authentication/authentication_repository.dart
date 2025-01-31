
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plant_snap/data/services/plant_identification_service.dart';
import 'package:plant_snap/screens/auth/login/login_screen.dart';
import 'package:plant_snap/screens/auth/onboarding/onboarding.dart';
import 'package:plant_snap/screens/auth/signup/verify_email.dart';
import 'package:plant_snap/screens/home_screen.dart';
import 'package:plant_snap/utils/exceptions/p_firebase_auth_exception.dart';
import 'package:plant_snap/utils/exceptions/p_firebase_exception.dart';
import 'package:plant_snap/utils/exceptions/p_format_exception.dart';
import 'package:plant_snap/utils/exceptions/p_platform_exception.dart';


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
    final user = _auth.currentUser;
    final plantService = PlantIdentificationService(
      apiKey: 'AIzaSyCKdQncVLpQrsVWWNLMBR5hG8qDbHpTtXY',
    );
    if(user != null){
      if(user.emailVerified){
        Get.offAll(()=> HomeScreen(plantService: plantService));
      }else{
        Get.offAll(()=>  VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
    }else{
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true ? Get.offAll(()=>   LoginScreen()): Get.offAll(const OnboardingScreen());
    }


  }

  /*********************Email & password sign in**********************/

  /// [EmailAuthentication]-Sign-in

  Future<UserCredential> loginWithEmailAndPassword(String email, String password)async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e){
      throw PFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw PFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const PFormatException();
    }on PlatformException catch (e){
      throw PPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication]--Resister

  Future<UserCredential> registerEmailAndPassword(String email,String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e){
      throw PFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw PFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const PFormatException();
    }on PlatformException catch (e){
      throw PPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication]--Re-Authentication



  ///[EmailVerification]- Mail Verification

  Future<void> sendEmailVerification()async{
    try{
      await _auth.currentUser?.sendEmailVerification();
    }on FirebaseAuthException catch (e){
      throw PFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw PFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const PFormatException();
    }on PlatformException catch (e){
      throw PPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please Try again.';
    }
  }

  /// [EmailAuthentication]--Forget Password
  Future<void> sendPasswordResetEmail(String email)async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
    }on FirebaseAuthException catch (e){
      throw PFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw PFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const PFormatException();
    }on PlatformException catch (e){
      throw PPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please Try again.';
    }
  }

  /*---------------- Delete User------------------------*/

  ///[LogoutUser]- Valid for any authentication
  Future<void> logout()async{
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(() =>  LoginScreen());
    }on FirebaseAuthException catch (e){
      throw PFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw PFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const PFormatException();
    }on PlatformException catch (e){
      throw PPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please Try again.';
    }
  }

  /// DELETE USER - Remove user Auth and Firebase Account.

}