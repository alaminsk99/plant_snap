// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plant_snap/app.dart';
import 'package:plant_snap/controllers/home_controller.dart';
import 'package:plant_snap/data/repositories/authentication/authentication_repository.dart';
import 'package:plant_snap/data/services/auth_service.dart';

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


  Get.put(AuthService());
  Get.put(HomeController());

  runApp(const App());
}
