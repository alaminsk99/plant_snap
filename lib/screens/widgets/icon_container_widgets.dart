import 'package:flutter/material.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';
import 'package:plant_snap/utils/helpers/helper_function.dart';



class IconContainerWidgets extends StatelessWidget {
  const IconContainerWidgets({super.key});

  @override
  Widget build(BuildContext context) {

    final width = PHelperFunction.screenWidth();
    // main Container
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
        ),
      ),
      /// Icon and Container
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            /// Icon-Image
            child: Icon(
              Icons.local_florist,
              size: width*0.5,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 20),
          /// Title
          Text(
            PTextStrings.homeScreenBodyTitleText,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 10),
          /// SubTitle
          Text(
            PTextStrings.homeScreenBodySubTitleText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          // Rest of the existing content
        ],
      ),
    );
  }
}
