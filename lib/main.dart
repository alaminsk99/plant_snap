// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/firebase_options.dart';
import 'package:plant_snap/screens/auth/login_screen.dart';
import 'package:plant_snap/screens/home_screen.dart';
import 'package:plant_snap/services/auth_service.dart';
import 'package:plant_snap/services/plant_identification_service.dart';
import 'package:plant_snap/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final plantService = PlantIdentificationService(
    apiKey: 'AIzaSyCKdQncVLpQrsVWWNLMBR5hG8qDbHpTtXY',
  );

  Get.put(AuthService());
  Get.put(plantService);

  runApp(PlantIdentifierApp(plantService: plantService));
}

class PlantIdentifierApp extends StatelessWidget {
  final PlantIdentificationService plantService;

  const PlantIdentifierApp({
    super.key,
    required this.plantService,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Plant Identifier',
      debugShowCheckedModeBanner: false,
      theme: PAppTheme.lightTheme,
      darkTheme: PAppTheme.darkTheme,
      home:  Obx(() {
        final user = Get.find<AuthService>().user.value;
        if (user == null) {
          return LoginScreen();
        }
        return HomeScreen(plantService: plantService);
      }),
    );
  }

}