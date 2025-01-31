// lib/screens/home_screen.dart
import 'dart:io';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:plant_snap/common/widgets/custom_app_bar.dart';
import 'package:plant_snap/common/widgets/history_section.dart';
import 'package:plant_snap/common/widgets/plant_details_screen.dart';
import 'package:plant_snap/controllers/user/user_controller.dart';
import 'package:plant_snap/data/services/plant_identification_service.dart';
import 'package:plant_snap/models/plant_model.dart';
import 'package:plant_snap/screens/settings/settings.dart';
import 'package:plant_snap/screens/widgets/clickble_icon.dart';

import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';
import 'package:plant_snap/utils/helpers/helper_function.dart';


class HomeScreen extends StatefulWidget {
  final PlantIdentificationService plantService;
  const HomeScreen({
    super.key,
    required this.plantService,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _selectedImage;
  PlantModel? _identifiedPlant;
  bool _isLoading = false;
  final _imagePicker = ImagePicker();

  Future<void> _pickImage({required ImageSource source}) async {
    try {
      final pickedFile = await _imagePicker.pickImage(source: source);
      if (pickedFile == null) {
        _showMessage('No image selected.');
        return;
      }

      setState(() {
        _selectedImage = File(pickedFile.path);
        _isLoading = true;
        _identifiedPlant = null;
      });

      await _identifyPlant(pickedFile.path);
    } catch (e) {
      _showMessage('Error picking image: $e');
    }
  }

  Future<void> _identifyPlant(String imagePath) async {
    try {
      final identifiedPlant = await widget.plantService.identifyPlant(File(imagePath));

      setState(() {
        _identifiedPlant = identifiedPlant;
        _isLoading = false;
      });

      if (_identifiedPlant != null) {
        _navigateToPlantDetails(_identifiedPlant!, imagePath);
      }
    } catch (e) {
      setState(() => _isLoading = false);
      _showMessage('Failed to identify plant: $e');
    }
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _navigateToPlantDetails(PlantModel plant, String imagePath) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlantDetailsScreen(
          plant: plant,
          originalImagePath: imagePath,
        ),
      ),
    );
  }

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
              height: height-110,
              child: Stack(
                children: [
                  // Main content section
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Show either upload section or preview
                        if (_selectedImage == null) _buildUploadSection(),
                        if (_selectedImage != null) _buildImagePreview(),
                        const SizedBox(height: 20),
                        _buildImagePickerButtons(),
                        const SizedBox(height: 20),
                        if (_isLoading) _buildLoadingIndicator(),
                        const SizedBox(height: 49),
                      ],
                    ),
                  ),

                  // Floating icons at the bottom
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Clock Icon with modern styling
                        ClickableIcon(onTap: ()=>Get.to(()=> HistorySection()),icon: Iconsax.clock),
                        // Settings Icon with modern styling
                        ClickableIcon(onTap: ()=>Get.to(()=> const SettingsScreen()), icon: Iconsax.setting),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  Widget _buildUploadSection() {
    // In HomeScreen's _buildUploadSection()

    final width = PHelperFunction.screenWidth();
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.local_florist,
              size: width*0.5,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            PTextStrings.homeScreenBodyTitleText,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 10),
          Text(
            PTextStrings.homeScreenBodySubTitleText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          // Rest of the existing content
        ],
      ),
    );
  }

  Widget _buildImagePreview() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            _selectedImage!,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildImagePickerButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // In _buildImagePickerButtons()
        ElevatedButton.icon(
          onPressed: () => _pickImage(source: ImageSource.camera),
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
        ElevatedButton.icon(
          onPressed: () => _pickImage(source: ImageSource.gallery),
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

  Widget _buildLoadingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CircularProgressIndicator(
        color: Colors.green.shade600,
      ),
    );
  }
}


