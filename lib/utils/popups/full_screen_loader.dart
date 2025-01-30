

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/common/widgets/loaders/animation_loader.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/helpers/helper_function.dart';

/// Utility class for maneging a full-screen Loading Dialog
class PFullScreenLoader{
/// Open a Full-screen Loading dialog a given text and animation
  /// This method does not return anythings
  ///
  ///
  ///
  /// Parameters
  /// ----text: The text will be displayed in loading Dialog.
  /// ----animation: The Lotte animation to be shown


  static void openLoadingDialog(String text, String animation){
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (_)=> PopScope(
          canPop: false,
          child: Container(
            color: PHelperFunction.isDarkMode(Get.context!)? PColors.black : PColors.secondary,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 250,),
                PAnimationLoaderWidgets(text: text, animation: animation),
              ],
            ),
          ),
        ),
    );
  }


  /// Stop the currently open loading dialog
  /// This method does not return anythings
  static stopLoading(){
    Navigator.of(Get.context!).pop();
  }



}