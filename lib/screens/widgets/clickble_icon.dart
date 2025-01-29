import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/constants/sizes.dart';


class ClickableIcon extends StatelessWidget {
  const ClickableIcon({
    super.key, required this.onTap, required this.icon,
  });

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(PSizes.md),
      ),
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child:  Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 28,
        ),
      ),
    );
  }
}