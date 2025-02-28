// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:plant_snap/app.dart';
import 'package:plant_snap/controllers/theme_contoller/theme_controller.dart';
import 'package:plant_snap/data/repositories/authentication/authentication_repository.dart';
import 'package:plant_snap/firebase_options.dart';


void main() async {
  /// Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Load environment variables before app starts
  await dotenv.load(fileName: '.env');

  /// GetX Local Storage
  await GetStorage.init();

  /// Theme changer
  Get.put(ThemeController());

  /// Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  /// Initialize Firebase & Authentication
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then(
      (FirebaseApp value)=> Get.put(AuthenticationRepository()));




  runApp(const App());
}
