import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_snap/common/widgets/loaders/loaders.dart';
import 'package:plant_snap/common/widgets/plant_details_screen.dart';
import 'package:plant_snap/data/repositories/plant_snap/plant_snap_repository.dart';
import 'package:plant_snap/data/services/network_manager.dart';
import 'package:plant_snap/data/services/plant_identification_service.dart';
import 'package:plant_snap/models/plant_model.dart';
import 'package:plant_snap/utils/exceptions/p_firebase_auth_exception.dart';
import 'package:plant_snap/utils/exceptions/p_firebase_exception.dart';
import 'package:plant_snap/utils/exceptions/p_format_exception.dart';
import 'package:plant_snap/utils/exceptions/p_platform_exception.dart';

class PlantSnapController extends GetxController {
  static PlantSnapController get instance => Get.find();

  /// Variable
  final plantService = PlantIdentificationService.instance;
  final repository = PlantSnapRepository.instance;

  /// Reactive state variables
  final Rx<File?> selectedImage = Rx<File?>(null);
  final Rx<PlantModel?> identifiedPlant = Rx<PlantModel?>(null);
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final _imagePicker = ImagePicker();

  /// any message created
  @override
  void onInit() {
    ever(errorMessage, (String message) {
      if (message.isNotEmpty) {
        PLoaders.errorSnackBar(title: "Error", message: message);
        errorMessage.value = '';
      }
    });
    super.onInit();
  }

  /// Image Picker
  Future<void> pickImage({required ImageSource source}) async {
    try {
      final pickedFile = await _imagePicker.pickImage(source: source);
      if (pickedFile == null) {
        errorMessage.value = 'No image selected.';
        return;
      }
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        // Remove Loader
        return;
      }



      selectedImage.value = File(pickedFile.path);
      isLoading.value = true;
      identifiedPlant.value = null;

      await _identifyPlant(File(pickedFile.path));
    } catch (e) {
      errorMessage.value = 'Error picking image: $e';
      isLoading.value = false;
    }
  }

  /// Identify Image and Upload to the firebase
  Future<void> _identifyPlant(File imageFile) async {
    try {
      final plant = await plantService.identifyPlant(imageFile);
      identifiedPlant.value = plant;
      repository.saveAiResponseData(plant);
      /// Navigate to the Next Screen
      Get.to(() => PlantDetailsScreen(
        plant: plant,
        originalImagePath: imageFile.path,
      ));
      /// Remove the loader
      isLoading.value = false;
    }on FirebaseAuthException catch (e){
      throw PFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw PFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const PFormatException();
    }on PlatformException catch (e){
      throw PPlatformException(e.code).message;
    }catch (e){
      isLoading.value = false;
      errorMessage.value = 'Something went wrong. Please try again';
    }
  }
}