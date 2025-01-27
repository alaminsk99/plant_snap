// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_snap/firebase_options.dart';
import 'package:plant_snap/screens/home_screen.dart';
import 'package:plant_snap/services/plant_identification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final plantService = PlantIdentificationService(
    apiKey: 'AIzaSyCKdQncVLpQrsVWWNLMBR5hG8qDbHpTtXY',
  );

  runApp(PlantIdentifierApp(plantService: plantService));
}

class PlantIdentifierApp extends StatelessWidget {
  final PlantIdentificationService plantService;

  const PlantIdentifierApp({
    Key? key,
    required this.plantService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Identifier',
      debugShowCheckedModeBanner: false,
      theme: _buildAppTheme(),
      home: HomeScreen(plantService: plantService),
    );
  }

  ThemeData _buildAppTheme() {
    return ThemeData(
      primarySwatch: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.montserratTextTheme(),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.green.shade800,
      ),
    );
  }
}