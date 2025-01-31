// lib/screens/home_screen.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:plant_snap/common/widgets/custom_app_bar.dart';
import 'package:plant_snap/controllers/plant_snap/plant_snap_controller.dart';
import 'package:plant_snap/controllers/user/user_controller.dart';
import 'package:plant_snap/screens/widgets/bottom_navigation_icons.dart';
import 'package:plant_snap/screens/widgets/home_loader.dart';
import 'package:plant_snap/screens/widgets/icon_container_widgets.dart';
import 'package:plant_snap/screens/widgets/image_picker_camera_and_gallery.dart';
import 'package:plant_snap/screens/widgets/image_preview_widgets.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';
import 'package:plant_snap/utils/helpers/helper_function.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final plantSnap = PlantSnapController.instance;

  @override
  Widget build(BuildContext context) {
    final height = PHelperFunction.screenHeight();
    final controller = Get.put(UserController());
    debugPrint(controller.user.value.fullName);
    return Scaffold(
      appBar: const CustomAppBar(title: PTextStrings.appName,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Modern padding style
            child: SizedBox(
              width: double.infinity,
              height: height - 110,
              child: Stack(
                children: [
                  // Main content section
                  Obx(
                  ()=> Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// First Icon-Image
                          if ( plantSnap.selectedImage.value == null) const IconContainerWidgets(),
                          /// When the image file uploaded the show the image
                          if ( plantSnap.selectedImage.value != null) const ImagePreviewWidgets(),
                          const SizedBox(height: 20),
                          /// Press the button to select the image
                          const ImagePickerCameraAndGallery(),
                          const SizedBox(height: 20),
                          /// Loader
                          if (plantSnap.isLoading.value) const HomeLoader(),
                          const SizedBox(height: 49),
                        ],
                      ),
                    ),
                  ),
                  /// Bottom Navigation
                  const BottomNavigationIcons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}