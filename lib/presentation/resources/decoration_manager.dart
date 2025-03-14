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

  final SizedBox sized12h = SizedBox(height: AppSizeHeight.s12);
  final SizedBox sized16h = SizedBox(height: AppSizeHeight.s16);
  final SizedBox sized20h = SizedBox(height: AppSizeHeight.s20);

  final SizedBox sized24h = SizedBox(height: AppSizeHeight.s24);

 

  final SizedBox sized4w = SizedBox(width: AppSizeWidth.s4);
  final SizedBox sized6w = SizedBox(width: AppSizeWidth.s6);
  final SizedBox sized12w = SizedBox(width: AppSizeWidth.s12);
  final SizedBox sized24w = SizedBox(width: AppSizeWidth.s24);


  final SizedBox shrink = const SizedBox.shrink();
}

