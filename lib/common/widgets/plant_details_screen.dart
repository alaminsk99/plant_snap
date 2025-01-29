
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_snap/models/plant_model.dart';
import 'package:plant_snap/utils/constants/colors.dart';


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
                  _buildPlantNameSection(context),

                  // Divider
                  Divider(color: Theme.of(context).colorScheme.primary.withOpacity(0.5), thickness: 1.5),

                  // Description Section
                  _buildSectionTitle('Description',context),
                  Text(
                    plant.description.replaceAll("*", ''),
                    style: Theme.of(context).textTheme.bodyMedium
                  ),

                  // Care Instructions
                  const SizedBox(height: 16),
                  _buildSectionTitle('Care Instructions',context),
                  ..._buildCareInstructionList(context),
                  const SizedBox(height: 16),
                  if (plant.plantFamily != null) ...[
                    _buildSectionTitle('Plant Family',context),
                    Text(
                      plant.plantFamily!.replaceAll("*", ""),
                      style: Theme.of(context).textTheme.bodyMedium,
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
        color: PColors.secondary,
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          plant.name.replaceAll("*", ''),
          style: GoogleFonts.montserrat(
            color: PColors.secondary,
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
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Icon(
                  Icons.local_florist,
                  size: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
              );
            },
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  // Plant Name and Scientific Name Section
  Widget _buildPlantNameSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          plant.name.replaceAll('*', ''),
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          'Scientific Name: ${plant.scientificName.replaceAll('*', '')}',
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  // Section Title Helper Method
  Widget _buildSectionTitle(String title,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  // Care Instructions List
  List<Widget> _buildCareInstructionList(BuildContext context) {
    return plant.careInstructions.map((instruction) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                instruction.replaceAll("*", ''),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }


}

