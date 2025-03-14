import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';
import 'package:one_does_project/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

// regular style
TextStyle getRegularStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontManager.fontFamily,
    FontWeightManager.regular,
    color,
  );
}

// light text style
TextStyle getLightStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontManager.fontFamily,
    FontWeightManager.light,
    color,
  );
}

// semibold text style
TextStyle getSemiBoldStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontManager.fontFamily,
    FontWeightManager.semiBold,
    color,
  );
}

// bold text style
TextStyle getBoldStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontManager.fontFamily,
    FontWeightManager.bold,
    color,
  );
}

// BLACK COLOR
TextStyle getRegularBlackStyle() {
  return getRegularStyle(fontSize: 13.0.sp, color: ColorManager.instance.black);
}

TextStyle getLightBlackStyle() {
  return getLightStyle(fontSize: 14.sp, color: ColorManager.instance.black);
}

TextStyle getBoldBlackStyle() {
  return getBoldStyle(fontSize: 14.sp, color: ColorManager.instance.black);
}

TextStyle getRegularBlackStyleTitle() {
  return getRegularStyle(fontSize: 18.0.sp, color: ColorManager.instance.black);
}

//Primary Color
TextStyle getRegularPrimaryStyle() {
  return getRegularStyle(
    fontSize: 14.0.sp,
    color: ColorManager.instance.primary,
  );
}

TextStyle getLightPrimaryStyle() {
  return getLightStyle(fontSize: 14.sp, color: ColorManager.instance.black);
}

TextStyle getBoldPrimaryStyle() {
  return getBoldStyle(fontSize: 14.sp, color: ColorManager.instance.primary);
}

TextStyle getBoldPrimaryStyleTitle() {
  return getBoldStyle(fontSize: 18.sp, color: ColorManager.instance.primary);
}

// white color
TextStyle getLightWhiteStyle() {
  return getLightStyle(fontSize: 16.sp, color: ColorManager.instance.white);
}

TextStyle getBoldWhiteStyle() {
  return getBoldStyle(fontSize: 14.sp, color: ColorManager.instance.white);
}

TextStyle getSemiBoldWhiteStyle() {
  return getSemiBoldStyle(
    fontSize: 14.0.sp,
    color: ColorManager.instance.white,
  );
}
