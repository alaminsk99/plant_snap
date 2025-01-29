// lib/controllers/home_controller.dart
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:plant_snap/data/services/auth_service.dart';
import 'package:plant_snap/models/plant_model.dart';
import 'package:plant_snap/models/scan_history_model.dart';


class HomeController extends GetxController {
  final scanHistory = <ScanHistoryModel>[].obs;
  final isLoading = false.obs;

  Future<void> saveScanResult(PlantModel plant, String imagePath) async {
    try {
      final user = Get.find<AuthService>().user.value;
      if (user == null) return;

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('plant_images/${user.uid}/${DateTime.now().millisecondsSinceEpoch}');

      await storageRef.putFile(File(imagePath));
      final imageUrl = await storageRef.getDownloadURL();

      final scanHistory = ScanHistoryModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: user.uid,
        plant: plant.copyWith(imageUrl: imageUrl),
        imagePath: imageUrl,
        scannedAt: DateTime.now(),
      );

      await FirebaseFirestore.instance
          .collection('scan_history')
          .doc(scanHistory.id)
          .set(scanHistory.toJson());

      this.scanHistory.add(scanHistory);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loadScanHistory() async {
    try {
      isLoading.value = true;
      final user = Get.find<AuthService>().user.value;
      if (user == null) return;

      final snapshot = await FirebaseFirestore.instance
          .collection('scan_history')
          .where('userId', isEqualTo: user.uid)
          .orderBy('scannedAt', descending: true)
          .get();

      scanHistory.value = snapshot.docs
          .map((doc) => ScanHistoryModel.fromJson(doc.data()))
          .toList();
    } finally {
      isLoading.value = false;
    }
  }
}