// lib/models/plant_model.dart
class PlantModel {
  final String name;
  final String scientificName;
  final String description;
  final List<String> careInstructions; // Ensure this is a List<String>
  final String imageUrl;
  final String? plantFamily;

  const PlantModel({
    required this.name,
    required this.scientificName,
    required this.description,
    required this.careInstructions,
    required this.imageUrl,
    this.plantFamily,
  });

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
      name: json['name'] ?? 'Unknown Plant',
      scientificName: json['scientificName'] ?? 'N/A',
      description: json['description'] ?? 'No description available',
      careInstructions: List<String>.from(json['careInstructions'] ?? []),
      imageUrl: json['imageUrl'] ?? '',
      plantFamily: json['plantFamily'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'scientificName': scientificName,
    'description': description,
    'careInstructions': careInstructions,
    'imageUrl': imageUrl,
    'plantFamily': plantFamily,
  };

  PlantModel copyWith({
    String? name,
    String? scientificName,
    String? description,
    List<String>? careInstructions,
    String? imageUrl,
    String? plantFamily,
  }) {
    return PlantModel(
      name: name ?? this.name,
      scientificName: scientificName ?? this.scientificName,
      description: description ?? this.description,
      careInstructions: careInstructions ?? this.careInstructions,
      imageUrl: imageUrl ?? this.imageUrl,
      plantFamily: plantFamily ?? this.plantFamily,
    );
  }
}
