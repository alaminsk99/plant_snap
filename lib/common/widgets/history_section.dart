// lib/widgets/history_section.dart
import 'package:flutter/material.dart';
import 'package:plant_snap/common/widgets/appbar/appbar_for_other_screen.dart';
import 'package:plant_snap/common/widgets/lists/history_list.dart';

// Changed to extend StatelessWidget
class HistorySection extends StatelessWidget {
  const HistorySection({super.key});  // Added constructor

  @override  // Added override annotation
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarForOtherScreen(title: 'History'),
      body: HistoryList(),
    );
  }
}