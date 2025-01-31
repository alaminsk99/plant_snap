
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_snap/common/widgets/history_section.dart';
import 'package:plant_snap/screens/settings/settings.dart';
import 'package:plant_snap/screens/widgets/clickble_icon.dart';


class BottomNavigationIcons extends StatelessWidget {
  const BottomNavigationIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClickableIcon(onTap: () => Get.to(() => HistorySection()), icon: Iconsax.clock),
          ClickableIcon(onTap: () => Get.to(() => const SettingsScreen()), icon: Iconsax.setting),
        ],
      ),
    );
  }
}
