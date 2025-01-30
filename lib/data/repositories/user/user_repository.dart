
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plant_snap/common/exceptions/p_firebase_auth_exception.dart';
import 'package:plant_snap/common/exceptions/p_format_exception.dart';
import 'package:plant_snap/common/exceptions/p_platform_exception.dart';
import 'package:plant_snap/models/user_model.dart';

/// Repository class for user-related operations.

class UserRepository extends GetxController{
    static UserRepository get instance => Get.find();


    /// Variable
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.

  Future<void> saveDataRecord(UserModel newUser) async{
    try{
      await _db.collection("Users").doc(newUser.id).set(newUser.toJson());
    }on FirebaseException catch (e){
      throw PFirebaseAuthException(e.code).message;
    }on FormatException catch (_){
      throw const PFormatException();
    }on PlatformException catch (e){
      throw PPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again.';
    }
  }


  /// Function to fetch user  details based on user ID.

  /// Function to update user data  in Firebase


}