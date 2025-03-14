import 'package:flutter/material.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';
import 'package:one_does_project/presentation/resources/values_manager.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key, required this.icon, required this.text, this.onTap});

  final Widget icon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      style: ListTileStyle.drawer,
      title: Row(
        children: <Widget>[
          icon,
          Padding(
            padding: EdgeInsets.only(left: AppPadding.p30),
            child: Text(
              text,
          style: getRegularBlackStyle(),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}