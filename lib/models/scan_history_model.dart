// lib/models/scan_history_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_snap/models/plant_model.dart';

class ScanHistoryModel {
  final String id;
  final String userId;
  final PlantModel plant;
  final String imagePath;
  final DateTime scannedAt;

  const ScanHistoryModel({
    required this.id,
    required this.userId,
    required this.plant,
    required this.imagePath,
    required this.scannedAt,
  });

  factory ScanHistoryModel.fromJson(Map<String, dynamic> json) {
    return ScanHistoryModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      plant: PlantModel.fromJson(json['plant']),
      imagePath: json['imagePath'] ?? '',
      scannedAt: (json['scannedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'plant': plant.toJson(),
    'imagePath': imagePath,
    'scannedAt': Timestamp.fromDate(scannedAt),
  };
}