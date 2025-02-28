
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/bindings/general_bindings.dart';
import 'package:plant_snap/controllers/theme_contoller/theme_controller.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/theme/theme.dart';


class App extends StatelessWidget {

  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PlantSnap',
      debugShowCheckedModeBanner: false,
      theme: PAppTheme.lightTheme,
      darkTheme: PAppTheme.darkTheme,
      themeMode: ThemeController.instance.theme,
      initialBinding: GeneralBindings(),
      /// Show loader or Circular Progress Indicator meanwhile Authenticate Repository is deciding to show relevant screen
      home: Scaffold(
        backgroundColor: PColors.primary,
        body: const Center(child: CircularProgressIndicator(color: PColors.secondary,),),
      ),
    );
  }

}