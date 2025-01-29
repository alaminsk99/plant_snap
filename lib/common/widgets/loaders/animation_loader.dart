

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/constants/sizes.dart';

class PAnimationLoaderWidgets extends StatelessWidget{
  const PAnimationLoaderWidgets(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,width: MediaQuery.sizeOf(context).width*0.8),
          const SizedBox(height: PSizes.defaultSpace,),
          Text(text,style: Theme.of(context).textTheme.bodyMedium,),
          const SizedBox(height: PSizes.defaultSpace,),
          showAction
              ? SizedBox(
                  width: 200,
                  child: OutlinedButton(
                    onPressed: onPressed,
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: PColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

}