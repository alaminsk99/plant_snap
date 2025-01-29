
import 'package:flutter/material.dart';

class SettingsSubHeadingTitle extends StatelessWidget {
  const SettingsSubHeadingTitle({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,style: const TextStyle().copyWith(color: Theme.of(context).colorScheme.primary.withOpacity(0.8),fontSize: 22,fontWeight: FontWeight.bold),);
  }
}