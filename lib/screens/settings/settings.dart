import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_snap/common/widgets/appbar/appbar_for_other_screen.dart';
import 'package:plant_snap/common/widgets/card/profile_image_with_name_card.dart';
import 'package:plant_snap/controllers/theme_contoller/theme_controller.dart';
import 'package:plant_snap/screens/privacy/privacy.dart';
import 'package:plant_snap/screens/settings/widgets/sub_heading_title.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const AppBarForOtherScreen(title: PTextStrings.settings,),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Account Settings
              const SettingsSubHeadingTitle(title: PTextStrings.profile,),
              const SizedBox(height: PSizes.md,),
              const ProfileImageWithNameCard(),
              const SizedBox(height: PSizes.md,),
              /// App Settings
              const SettingsSubHeadingTitle(title: PTextStrings.appSettings),
              const SizedBox(height: PSizes.md,),
              /// Switch to dark mode
              Obx(
                (){
                  final controller = ThemeController.instance;
                  return  ListTile(
                    title: Text(
                      PTextStrings.swtToDakMod,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    leading: Icon(Iconsax.moon, color: Theme.of(context).primaryColor,size: 29,),
                    trailing: Switch(value: controller.isDarkMode, onChanged: (value) => controller.toggleTheme(),),
                  );
                }
              ),
              /// Privacy and Policy
               ListTile(
                leading: Icon(Icons.local_florist,size: 29,color: Theme.of(context).colorScheme.primary,),
                 title: Text( PTextStrings.aboutUs, style: Theme.of(context).textTheme.titleMedium,),
                 onTap: ()=>Get.to(()=> const AboutUsScreen()),
              ),

            ],

          ),
        ),
      ),
    );
  }
}


