import 'package:flutter/material.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';

class CustomAppBarTitle extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarTitle({super.key, required this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,

      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(color: ColorManager.instance.grey3),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
