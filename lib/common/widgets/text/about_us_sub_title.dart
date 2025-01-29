import 'package:flutter/material.dart';

class AboutUsSubTitle extends StatelessWidget {
  const AboutUsSubTitle({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.headlineSmall,);
  }
}