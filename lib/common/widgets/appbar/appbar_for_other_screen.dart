
import 'package:flutter/material.dart';
import 'package:plant_snap/common/widgets/custom_app_bar.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/device/device_utility.dart';

class AppBarForOtherScreen extends StatelessWidget implements PreferredSizeWidget {
  const AppBarForOtherScreen({
    super.key, required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(title: title,isLeadingIcon: true,isCenterTitle: false,backgroundColor: Theme.of(context).colorScheme.primary,textColorTheme: const TextStyle().copyWith(fontSize: 24.0,fontWeight: FontWeight.w600,color: PColors.secondary),);
  }

  @override
  Size get preferredSize => Size.fromHeight(PDeviceUtility.getAppBarHeight());

}