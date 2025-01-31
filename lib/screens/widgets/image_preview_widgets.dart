
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/controllers/plant_snap/plant_snap_controller.dart';


class ImagePreviewWidgets extends StatelessWidget {
  const ImagePreviewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Obx(
          ()=> Image.file(
              PlantSnapController.instance.selectedImage.value!,
              height: 310,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
