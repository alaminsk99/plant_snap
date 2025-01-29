// lib/widgets/history_section.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/common/widgets/appbar/appbar_for_other_screen.dart';
import 'package:plant_snap/common/widgets/custom_app_bar.dart';
import 'package:plant_snap/common/widgets/scan_history_card.dart';
import 'package:plant_snap/controllers/home_controller.dart';
import 'package:plant_snap/screens/settings/settings.dart';
import 'package:plant_snap/utils/constants/colors.dart';


class HistorySection extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarForOtherScreen(title: 'History'),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.scanHistory.isEmpty) {
          return Center(
            child: Text(
              'No scan history yet',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: controller.scanHistory.length,
          itemBuilder: (context, index) {
            return ScanHistoryCard(scan: controller.scanHistory[index]);
          },
        );
      }),
    );

  }
}