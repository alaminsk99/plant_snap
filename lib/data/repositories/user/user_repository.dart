
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plant_snap/data/repositories/authentication/authentication_repository.dart';
import 'package:plant_snap/models/user_model.dart';
import 'package:plant_snap/utils/exceptions/p_firebase_auth_exception.dart';
import 'package:plant_snap/utils/exceptions/p_firebase_exception.dart';
import 'package:plant_snap/utils/exceptions/p_format_exception.dart';
import 'package:plant_snap/utils/exceptions/p_platform_exception.dart';

/// Repository class for user-related operations.

class UserRepository extends GetxController{
    static UserRepository get instance => Get.find();


    /// Variable
  final FirebaseFirestore _db = FirebaseFirestore.instance;




  /// Function to save user data to Firestore.
  Future<void> saveDataRecord(UserModel newUser) async{
    try{
      await _db.collection("Users").doc(newUser.id).set(newUser.toJson());
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


  /// Function to fetch user  details based on user ID.
    Future<UserModel> fetchUserDetails() async{
      try{
        final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
        if(documentSnapshot.exists){
          return UserModel.fromSnapshot(documentSnapshot);
        }else{
          return UserModel.empty();
        }
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

  /// Function to update user data  in Firebase
    Future<void> updateUserDetails(UserModel updateUser) async{
      try{
        await _db.collection("Users").doc(updateUser.id).update(updateUser.toJson());
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

    /// Update any field in specific  Users Collection
    Future<void> updateSingleField(Map<String,dynamic> json) async{
      try{
        await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
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

    /// Function to remove user data from Firestore

    Future<void> removedUserRecord(String userId) async{
      try{
        await _db.collection("Users").doc(userId).delete();
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