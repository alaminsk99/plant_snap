
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/bindings/general_bindings.dart';
import 'package:plant_snap/data/services/plant_identification_service.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/theme/theme.dart';


class App extends StatelessWidget {
  final PlantIdentificationService plantService;

  const App({
    super.key,
    required this.plantService,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PlantSnap',
      debugShowCheckedModeBanner: false,
      theme: PAppTheme.lightTheme,
      darkTheme: PAppTheme.darkTheme,
      initialBinding: GeneralBindings(),

      /// Show loader or Circular Progress Indicator meanwhile Authenticate Repository is deciding to show relevant screen
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: const Center(child: CircularProgressIndicator(color: PColors.secondary,),),
      ),
    );
  }

}