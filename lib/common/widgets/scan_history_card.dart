// lib/widgets/scan_history_card.dart
import 'package:flutter/material.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/constants/sizes.dart';



class ScanHistoryCard extends StatelessWidget {


  const ScanHistoryCard({super.key, this.title, this.description, });
  final String? title;
  final String? description;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PSizes.md),
      ),
      child: InkWell(
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "Plant name is unknown",
                style: Theme.of(context).textTheme.titleSmall,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: PSizes.sm),
              Text(
                description ?? 'Description is unknown',
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
