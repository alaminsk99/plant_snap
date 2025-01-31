
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plant_snap/data/repositories/authentication/authentication_repository.dart';
import 'package:plant_snap/models/plant_model.dart';
import 'package:plant_snap/utils/exceptions/p_firebase_auth_exception.dart';
import 'package:plant_snap/utils/exceptions/p_firebase_exception.dart';
import 'package:plant_snap/utils/exceptions/p_format_exception.dart';
import 'package:plant_snap/utils/exceptions/p_platform_exception.dart';

class PlantSnapRepository extends GetxController{
  static PlantSnapRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;


  /// Save Ai Response Data in the firestore.

  Future<void> saveAiResponseData(PlantModel plant)async{
    try{
      await _db.collection('PlantSnap').doc(AuthenticationRepository.instance.authUser?.uid).collection('History').add(plant.toJson());
    }on FirebaseAuthException catch (e){
      throw PFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw PFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const PFormatException();
    }on PlatformException catch (e){
      throw PPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again.';
    }
  }


}