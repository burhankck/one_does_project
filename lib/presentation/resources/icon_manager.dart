
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';
import 'package:one_does_project/presentation/resources/values_manager.dart';

class IconManager {
  
  static Icon add = Icon(
    LineIcons.plus,
    size: AppSizeHeight.s24,
  );

  
  static Icon globe = const Icon(LineIcons.globe);
  

  static Icon check = Icon(
    Icons.check,
    color: ColorManager.instance.green,
  );


 


}