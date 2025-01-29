
import 'package:flutter/material.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/theme/custom_themes/app_bar_theme.dart';
import 'package:plant_snap/utils/theme/custom_themes/text_field_theme.dart';
import 'package:plant_snap/utils/theme/custom_themes/text_theme.dart';


class PAppTheme{

  PAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: PColors.materialPrimaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: PTextTheme.lightTextTheme,
    brightness: Brightness.light,
    primaryColor: PColors.primary,

    scaffoldBackgroundColor: PColors.secondary,
    appBarTheme: PAppBarTheme.lightAppBarTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: PColors.primary,
      brightness: Brightness.light,
    ).copyWith(surfaceTint: PColors.primary.withOpacity(0.1),),
    inputDecorationTheme: PTextFieldTheme.lightInputDecorationTheme,



  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: PColors.materialPrimaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: PTextTheme.darkTextTheme,
    brightness: Brightness.dark,
    primaryColor: PColors.primary,
    scaffoldBackgroundColor: PColors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: PColors.primary,
      brightness: Brightness.dark,
    ).copyWith(surfaceTint: PColors.primary.withOpacity(0.1),),
    inputDecorationTheme: PTextFieldTheme.darkInputDecorationTheme,
    appBarTheme: PAppBarTheme.darkAppBarTheme,
  );

}