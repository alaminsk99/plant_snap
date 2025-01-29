
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/data/services/network_manager.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }

}