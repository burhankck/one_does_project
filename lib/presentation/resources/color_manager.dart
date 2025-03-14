import 'package:flutter/material.dart';

class ColorManager {
  static final ColorManager _instance = ColorManager._init();
  static ColorManager get instance => _instance;
  ColorManager._init();

  final Color primary = HexColor.fromHex("#10217d");
  final Color primaryLightColor = HexColor.fromHex("#4e49ad");
  final Color primaryDarkColor = HexColor.fromHex("#000050");
  final Color primaryAlternativeColor = HexColor.fromHex("#FED9F5");
  final Color primaryPurpleColor = HexColor.fromHex("#FED9F5");

  final Color darkGrey = HexColor.fromHex("#525252");
  final Color grey = HexColor.fromHex("#737477");
  final Color lightGrey = HexColor.fromHex("#9E9E9E");

  final Color error = HexColor.fromHex("#F22E2E");
  final Color grey1 = HexColor.fromHex("#707070");
  final Color grey2 = HexColor.fromHex("#797979");
  final Color white = HexColor.fromHex("#FFFFFF");
  final Color black = HexColor.fromHex("#000000");
  final Color blue = HexColor.fromHex("#448FF2");
  final Color? grey3 = HexColor.fromHex("#E0E0E0");

  final Color purple = HexColor.fromHex("#948BFF");
  final Color lightPurple = HexColor.fromHex("#C4C0F5");
  final Color redColor = HexColor.fromHex("#ED5E68");
  final Color lGrey = HexColor.fromHex('#EBECF0');
  final Color yellow = HexColor.fromHex("#FEA725");
  final Color lightYellow = const Color.fromARGB(242, 252, 220, 157);

  final Color orange = HexColor.fromHex("#FF7854");
  final Color lightOrange = const Color.fromARGB(244, 236, 205, 148);

  final Color green = const Color.fromARGB(253, 27, 184, 124);
  final Color lightGreen = const Color.fromARGB(176, 119, 231, 188);

  //Menu color
  final Color menuBlueColor = HexColor.fromHex("#65A4DA");
  final Color menuDarkBlueColor = HexColor.fromHex("#8F98FF");
  final Color menuPurpleColor = HexColor.fromHex("#B59AF5");
  final Color menuOrangeColor = HexColor.fromHex("#FF7648");
  final Color menuGreenColor = HexColor.fromHex("#4DC591");
  final Color menuYellowColor = HexColor.fromHex("#F2C288");
  final Color menuPinkColor = HexColor.fromHex("#FF8080");
  final Color menuDarkGreenColor = HexColor.fromHex("#73ADA0");
  final Color menuDarkLightGreenColor = HexColor.fromHex("#A8C0B1");
  final Color menuYellow1Color = HexColor.fromHex("#D9AE5F");
  final Color menuLightPinkColor = HexColor.fromHex("#FFB79E");
  final Color menuTealColor = HexColor.fromHex("#A1C7E0");

  final Color blueColor = HexColor.fromHex("#EDF1FB");
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
