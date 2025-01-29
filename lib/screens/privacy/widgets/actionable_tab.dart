import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_snap/utils/constants/colors.dart';

class ActionableTab extends StatelessWidget {
  const ActionableTab({
    super.key, required this.onTap, required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Title
          Text(title,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: PColors.termTextColor),),
          /// icon
          Icon(Iconsax.arrow_right_3,color: Theme.of(context).colorScheme.primary),
        ],),
    );
  }
}