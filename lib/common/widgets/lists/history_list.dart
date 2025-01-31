import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/common/widgets/scan_history_card.dart';
import 'package:plant_snap/controllers/plant_snap_history/plant_snap_history_controller.dart';
import 'package:plant_snap/screens/widgets/home_loader.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final allHistory = Get.put(PlantSnapHistoryController());
    return Obx(
        (){
          if(allHistory.isLoading.value) return const Center(child: HomeLoader(),);
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: allHistory.plants.length,
            itemBuilder: (_, index) {
              final data = allHistory.plants[index];
            return  ScanHistoryCard(title: data.name.replaceAll("**", " "),description: data.description.replaceAll("**", " "),);
          },);
        }
    );
  }
}