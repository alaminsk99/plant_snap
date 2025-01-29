
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_snap/utils/constants/sizes.dart';

class ProfileImageWithNameCard extends StatelessWidget {
  const ProfileImageWithNameCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [

      Expanded(child: Row(children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).colorScheme.outline.withOpacity(0.3)),
          ),

          child:  Padding(
            padding: const EdgeInsets.all(PSizes.sm),
            child: Center(child: Icon(Iconsax.user,size: 30,color: Theme.of(context).primaryColor,)),
          ),
        ),
        const SizedBox(width: PSizes.md/2,),
        /// Name and email
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Name
            Text("Alamin Sk", style: Theme.of(context).textTheme.headlineSmall,),
            const SizedBox(width: PSizes.md/3,),
            Text("saikha752@gmail.com",style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,),
          ],
        ),
      ],)),

      GestureDetector(
        onTap: (){},
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),

          child:  Padding(
            padding: const EdgeInsets.all(PSizes.sm),
            child: Center(child: Icon(Iconsax.logout,size: 30,color: Theme.of(context).primaryColor,)),
          ),
        ),
      ),



    ],);
  }
}
