import 'package:flutter/material.dart';
import 'package:one_does_project/presentation/resources/values_manager.dart';

class BorderRadiusManager {
  static final BorderRadiusManager _instance = BorderRadiusManager._init();
  static BorderRadiusManager get instance => _instance;
  BorderRadiusManager._init();

  BorderRadius onlyLeftRight20 = BorderRadius.only(
    topLeft: Radius.circular(
      AppSizeRadius.r20,
    ),
    bottomLeft: Radius.circular(
      AppSizeRadius.r20,
    ),
  );

  BorderRadius all20 = BorderRadius.all(
    Radius.circular(
      AppSizeRadius.r20,
    ),
  );
  BorderRadius all12 = BorderRadius.all(
    Radius.circular(
      AppSizeRadius.r12,
    ),
  );
}
