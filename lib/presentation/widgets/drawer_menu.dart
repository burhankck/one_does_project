// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';
import 'package:one_does_project/presentation/resources/decoration_manager.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';
import 'package:one_does_project/presentation/widgets/driver_item.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadiusManager.instance.all20,
        child: SizedBox(
          child: Drawer(
            width: MediaQuery.of(context).size.width / 1.2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // Drawer Header
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: ColorManager.instance.grey3,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Ayarlar', style: getRegularBlackStyleTitle()),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [_buildChangeTheme(), _buildChangeLanguage()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DrawerItem _buildChangeTheme() {
    return DrawerItem(
      icon: Icon(
        Icons.nightlight_round,
        color: ColorManager.instance.primary,
      ), //
      text: "Tema Değiştir",
      onTap: () {},
    );
  }

  DrawerItem _buildChangeLanguage() {
    return DrawerItem(
      icon: Icon(Icons.language, color: ColorManager.instance.primary),
      text: "Dil Değiştir",
      onTap: () {},
    );
  }
}
