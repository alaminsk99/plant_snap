import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_snap/common/widgets/appbar/appbar_for_other_screen.dart';
import 'package:plant_snap/common/widgets/custom_app_bar.dart';
import 'package:plant_snap/common/widgets/text/about_us_sub_title.dart';
import 'package:plant_snap/screens/privacy/widgets/actionable_tab.dart';
import 'package:plant_snap/screens/settings/settings.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';
import 'package:plant_snap/utils/device/device_utility.dart';


class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: const AppBarForOtherScreen(title: "About us"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Current Version
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AboutUsSubTitle(title: 'Current Version',),
                  const SizedBox(height: PSizes.xs,),
                  Text('14.8.0',style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
              const SizedBox(height: PSizes.sm,),
              Divider(color: Theme.of(context).colorScheme.primary,thickness: 0.5,),
              const SizedBox(height: PSizes.sm,),

              /// About PlanSnap
              const AboutUsSubTitle(title: "About PlantSnap:"),
              const SizedBox(height: PSizes.xs,),
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                     text: PTextStrings.aboutPlantSnap,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: PTextStrings.stringAboutContact,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: PTextStrings.ratingAboutUs,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ]
              )),
              const SizedBox(height: PSizes.md,),
              Divider(color: Theme.of(context).colorScheme.primary,thickness: 0.5,),
              const SizedBox(height: PSizes.sm,),



              ///Term of services
              ActionableTab(onTap: ()async{
                const String termsAndServices = "https://github.com/alaminsk99/PlantSnap-Terms-of-Services";
                PDeviceUtility.launchUrl(termsAndServices);
              },title: PTextStrings.termAndService,),
              const SizedBox(height: PSizes.sm,),
              ///Privacy policy
              Divider(color: Theme.of(context).colorScheme.primary,thickness: 0.5,),
              const SizedBox(height: PSizes.sm,),
              ActionableTab(onTap: () async{
                const  String privacyPolicy = "https://github.com/alaminsk99/PlantSnap-Privacy-Policy";
                 PDeviceUtility.launchUrl(privacyPolicy);
              },title: PTextStrings.privacyAndPolicy,),
            ],
          ),
        ),
      ),
    );
  }
}




