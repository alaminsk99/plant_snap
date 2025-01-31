import 'package:flutter/material.dart';


class HomeLoader extends StatelessWidget {
  const HomeLoader({super.key});

  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(top: 20),
       child: CircularProgressIndicator(color: Colors.green.shade600),
     );
  }
}
