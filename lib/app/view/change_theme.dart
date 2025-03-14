import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:one_does_project/app/view_model/theme_cubit.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';
import 'package:one_does_project/presentation/resources/decoration_manager.dart';
import 'package:one_does_project/presentation/resources/icon_manager.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';
import 'package:one_does_project/translations/locale_keys.g.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({super.key});

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return ExpansionTile(
          leading: Icon(
            LineIcons.paintBrush,
            color: ColorManager.instance.primary,
          ),
          title: Text(
            LocaleKeys.drawer_themeChange.tr(),
            style: getRegularBlackStyle(),
          ),
          textColor: ColorManager.instance.black,
          children: [
            ListTile(
              leading: Icon(
                Icons.wb_sunny,
                color: ColorManager.instance.primary,
              ),
              title: Text(
                LocaleKeys.drawer_lightTheme.tr(),
                style: getRegularBlackStyle(),
              ),
              trailing:
                  themeMode == ThemeMode.light
                      ? IconManager.check
                      : SizedBoxManager.instance.shrink,
              onTap: () {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: Icon(
                Icons.nights_stay, // Dark theme iconu
                color: ColorManager.instance.primary,
              ),
              title: Text(
                LocaleKeys.drawer_darkTheme.tr(),
                style: getRegularBlackStyle(),
              ),
              trailing:
                  themeMode == ThemeMode.dark
                      ? IconManager.check
                      : SizedBoxManager.instance.shrink,
              onTap: () {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
          ],
        );
      },
    );
  }
}
