import 'package:flutter/material.dart';

class ColorManager {
  static final ColorManager _instance = ColorManager._init();
  static ColorManager get instance => _instance;
  ColorManager._init();

  final Color primary = HexColor.fromHex("#10217d");
  final Color primaryLightColor = HexColor.fromHex("#4e49ad");
  final Color primaryDarkColor = HexColor.fromHex("#000050");
  

  final Color grey = HexColor.fromHex("#737477");
  

  
  final Color grey1 = HexColor.fromHex("#707070");
  final Color grey2 = HexColor.fromHex("#797979");
  final Color white = HexColor.fromHex("#FFFFFF");
  final Color black = HexColor.fromHex("#000000");
 
  final Color? grey3 = HexColor.fromHex("#E0E0E0");

  
  final Color redColor = HexColor.fromHex("#ED5E68");
  final Color lGrey = HexColor.fromHex('#EBECF0');
 

  

  final Color green = const Color.fromARGB(253, 27, 184, 124);
  

  
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');

    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; 
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
