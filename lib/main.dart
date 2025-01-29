// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plant_snap/app.dart';
import 'package:plant_snap/controllers/home_controller.dart';
import 'package:plant_snap/data/repositories/authentication/authentication_repository.dart';
import 'package:plant_snap/data/services/plant_identification_service.dart';
import 'package:plant_snap/firebase_options.dart';
import 'package:plant_snap/screens/auth/login/login_screen.dart';
import 'package:plant_snap/screens/home_screen.dart';

import 'package:plant_snap/utils/theme/theme.dart';

void main() async {
  /// Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// GetX Local Storage
  await GetStorage.init();
  /// Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  /// Initialize Firebase & Authentication
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then(
      (FirebaseApp value)=> Get.put(AuthenticationRepository()));

  final plantService = PlantIdentificationService(
    apiKey: 'AIzaSyCKdQncVLpQrsVWWNLMBR5hG8qDbHpTtXY',
  );

  Get.put(HomeController());
  Get.put(plantService);

  runApp(App(plantService: plantService));
}
