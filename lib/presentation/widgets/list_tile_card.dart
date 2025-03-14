import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';
import 'package:one_does_project/presentation/resources/values_manager.dart';

class CustomListTileCard extends StatelessWidget {
  const CustomListTileCard(
      {super.key,
      required this.title,
      this.subTitle,
      this.leading,
      this.onTap,
      this.visualDensity,
      this.contentPadding,
      this.isThreeLine = false,
      this.trailing});

  final String title;
  final Widget? trailing;
  final Widget? leading;
  final Widget? subTitle;
  final VoidCallback? onTap;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry? contentPadding;
  final bool isThreeLine;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizeRadius.r8),
      ),
      elevation: AppSizeHeight.s1,
      child: Column(
        children: [
          ListTile(
            onTap: onTap,
            dense: true,
            trailing: trailing,
            visualDensity: VisualDensity.compact,
            contentPadding: contentPadding ??
                EdgeInsets.only(bottom: 2.h, top: 2.h, left: 10.w, right: 3.w),
            leading: leading,
            isThreeLine: isThreeLine,
            title: Text(
              title,
              style: getMediumStyle(
                  color: ColorManager.instance.black, fontSize: 13.sp),
            ),
            subtitle: subTitle,
          ),
        ],
      ),
    );
  }
}