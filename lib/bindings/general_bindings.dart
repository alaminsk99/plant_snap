
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/controllers/plant_snap/plant_snap_controller.dart';
import 'package:plant_snap/data/repositories/plant_snap/plant_snap_repository.dart';
import 'package:plant_snap/data/repositories/user/user_repository.dart';
import 'package:plant_snap/data/services/network_manager.dart';
import 'package:plant_snap/data/services/plant_identification_service.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(PlantIdentificationService(apiKey: 'AIzaSyCKdQncVLpQrsVWWNLMBR5hG8qDbHpTtXY'));
    Get.put(UserRepository());
    Get.put(PlantSnapRepository());
    Get.put(PlantSnapController());
  }

}