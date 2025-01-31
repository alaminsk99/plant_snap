import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_snap/controllers/plant_snap/plant_snap_controller.dart';

class ImagePickerCameraAndGallery extends StatelessWidget {
  const ImagePickerCameraAndGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PlantSnapController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        /// Icon Button for Camera
        ElevatedButton.icon(
          onPressed: () => controller.pickImage(source: ImageSource.camera),
          icon: const Icon(Icons.camera_alt),
          label: const Text('Camera'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0, // Flat design trend
          ),
        ),
        /// Icon Button for Gallery
        ElevatedButton.icon(
          onPressed: () => controller.pickImage(source: ImageSource.gallery),
          icon: const Icon(Icons.photo_library),
          label: const Text('Gallery'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
        ),
      ],
    );
  }
}
