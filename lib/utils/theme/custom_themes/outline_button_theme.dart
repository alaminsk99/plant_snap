import 'package:flutter/material.dart';
import 'package:plant_snap/utils/constants/colors.dart';

class POutlinedButtonTheme{

  POutlinedButtonTheme._();

  /// For light theme

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: PColors.black,
      side: const BorderSide(color:  PColors.primary),
      textStyle: const TextStyle(color: PColors.primary,fontSize: 16,fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),



    ),
  );
  /// For dark theme

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: PColors.secondary,
      side: const BorderSide(color: PColors.primary),
      textStyle: const TextStyle(color: PColors.primary,fontSize: 16,fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),


    ),
  );
}