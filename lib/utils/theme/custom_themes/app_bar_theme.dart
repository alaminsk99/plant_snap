import 'package:flutter/material.dart';
import 'package:plant_snap/utils/constants/colors.dart';

class PAppBarTheme{

  PAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    foregroundColor: PColors.primary,
    iconTheme: IconThemeData(color: PColors.white,size: 24),
    actionsIconTheme: IconThemeData(color: PColors.secondary,size: 24),
    titleTextStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: PColors.primary),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    foregroundColor: PColors.primary,
    iconTheme: IconThemeData(color: PColors.white,size: 24),
    actionsIconTheme: IconThemeData(color: PColors.secondary,size: 24),
    titleTextStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: PColors.primary),
  );

}