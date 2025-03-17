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


class SizedBoxManager {
  static final SizedBoxManager _instance = SizedBoxManager._init();
  static SizedBoxManager get instance => _instance;
  SizedBoxManager._init();

  final SizedBox sized2h = SizedBox(height: AppSizeHeight.s2);

  final SizedBox sized4h = SizedBox(height: AppSizeHeight.s4);
  final SizedBox sized6h = SizedBox(height: AppSizeHeight.s6);
  final SizedBox sized8h = SizedBox(height: AppSizeHeight.s8);



  final SizedBox shrink = const SizedBox.shrink();
}