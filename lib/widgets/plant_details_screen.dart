
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/plant_model.dart';

class PlantDetailsScreen extends StatelessWidget {
  final PlantModel plant;
  final String originalImagePath;

  const PlantDetailsScreen({
    super.key,
    required this.plant,
    required this.originalImagePath
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Animated App Bar with Image
          _buildSliverAppBar(context),

          // Main Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Plant Name and Scientific Name
                  _buildPlantNameSection(),

                  // Divider
                  Divider(color: Colors.green.shade200, thickness: 1.5),

                  // Description Section
                  _buildSectionTitle('Description'),
                  Text(
                    plant.description.replaceAll("*", ''),
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),

                  // Care Instructions
                  const SizedBox(height: 16),
                  _buildSectionTitle('Care Instructions'),
                  ..._buildCareInstructionList(),
                  const SizedBox(height: 16),
                  if (plant.plantFamily != null) ...[
                    _buildSectionTitle('Plant Family'),
                    Text(
                      plant.plantFamily!.replaceAll("*", ""),
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.green.shade600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Sliver App Bar with Animated Image
  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300.0,
      floating: false,
      pinned: true,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          plant.name.replaceAll("*", ''),
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        background: Hero(
          tag: plant.name.replaceAll("*", ''),
          child: Image.file(
            File(originalImagePath),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.green.shade100,
                child: Icon(
                  Icons.local_florist,
                  size: 100,
                  color: Colors.green.shade400,
                ),
              );
            },
          ),
        ),
      ),
      backgroundColor: Colors.green.shade700,
    );
  }

  // Plant Name and Scientific Name Section
  Widget _buildPlantNameSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          plant.name.replaceAll('*', ''),
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade800,
          ),
        ),
        Text(
          'Scientific Name: ${plant.scientificName.replaceAll('*', '')}',
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Colors.green.shade600,
          ),
        ),
      ],
    );
  }

  // Section Title Helper Method
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.green.shade700,
        ),
      ),
    );
  }

  // Care Instructions List
  List<Widget> _buildCareInstructionList() {
    return plant.careInstructions.map((instruction) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green.shade600,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                instruction.replaceAll("*", ''),
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }


}

