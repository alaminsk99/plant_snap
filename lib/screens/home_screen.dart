// lib/screens/home_screen.dart
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:plant_snap/models/plant_model.dart';
import 'package:plant_snap/services/plant_identification_service.dart';
import 'package:plant_snap/widgets/custom_app_bar.dart';
import 'package:plant_snap/widgets/plant_details_screen.dart';

class HomeScreen extends StatefulWidget {
  final PlantIdentificationService plantService;
  const HomeScreen({
    Key? key,
    required this.plantService,
  }) : super(key: key);

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
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_selectedImage == null) _buildUploadSection(),
              if (_selectedImage != null) _buildImagePreview(),
              const SizedBox(height: 20),
              _buildImagePickerButtons(),
              if (_isLoading) _buildLoadingIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUploadSection() {
    return Column(
      children: [
        Icon(
          Icons.local_florist,
          size: 100,
          color: Colors.green.shade300,
        ),
        const SizedBox(height: 20),
        Text(
          'Upload a Plant Image',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 10),
        Text(
          'Take a photo or select from gallery to identify the plant',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildImagePreview() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            _selectedImage!,
            height: 250,
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
        ElevatedButton.icon(
          onPressed: () => _pickImage(source: ImageSource.camera),
          icon: const Icon(Icons.camera_alt),
          label: const Text('Camera'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green.shade600,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () => _pickImage(source: ImageSource.gallery),
          icon: const Icon(Icons.photo_library),
          label: const Text('Gallery'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green.shade600,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
