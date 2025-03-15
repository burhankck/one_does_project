import 'package:flutter/material.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';

class IconWithTextButton extends StatelessWidget {
  const IconWithTextButton({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
          ),
          Text(
            title,
            style: getBoldPrimaryStyle(),
          )
        ],
      ),
    );
  }
}