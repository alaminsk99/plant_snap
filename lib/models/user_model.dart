// lib/models/user_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_snap/models/plant_model.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? profileImage;
  final DateTime createdAt;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.profileImage,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profileImage: json['profileImage'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'name': name,
    'email': email,
    'profileImage': profileImage,
    'createdAt': Timestamp.fromDate(createdAt),
  };
}

