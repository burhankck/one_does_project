import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';

class BookLoading extends StatelessWidget {
  const BookLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50.h,
        width: 50.w,
        child: CircularProgressIndicator(color: ColorManager.instance.primary),
      ),
    );
  }
}
