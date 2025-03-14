import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    this.subTitle,
    this.widget,
    this.color,
    this.body,

    this.leading,
  });

  final String title;
  final String? subTitle;
  final Color? color;

  final Widget? widget;
  final Widget? body;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? ColorManager.instance.menuYellow1Color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  widget ?? const SizedBox.shrink(),
                  Expanded(
                    child: Text(
                      title,
                      style: getRegularBlackStyle().copyWith(
                        color: ColorManager.instance.primary,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),

                  leading ?? const SizedBox.shrink(),
                ],
              ),
            ),
            Divider(color: ColorManager.instance.menuDarkBlueColor),
            Align(
              alignment: Alignment.centerLeft,
              child:
                  body ??
                  Text(
                    subTitle ?? "",
                    style: getRegularBlackStyle().copyWith(
                      color: ColorManager.instance.black,
                      fontSize: 14.sp,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
