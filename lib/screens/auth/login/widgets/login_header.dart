import 'package:flutter/material.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Back',
          style: Theme.of(context).textTheme.headlineMedium!,
        ),
        const SizedBox(height: PSizes.sm,),
        Text.rich(
            TextSpan(
                children: [
                  TextSpan(text: PTextStrings.loginScreenTile, style: Theme.of(context).textTheme.bodyMedium ),

                ]
            )
        ),
      ],
    );
  }
}
