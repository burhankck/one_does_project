import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:one_does_project/presentation/language_change/view_model/language_cubit.dart';
import 'package:one_does_project/presentation/language_change/view_model/langueage_state.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';
import 'package:one_does_project/presentation/resources/decoration_manager.dart';
import 'package:one_does_project/presentation/resources/icon_manager.dart';
import 'package:one_does_project/presentation/resources/image_path_manager.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';
import 'package:one_does_project/presentation/resources/values_manager.dart';
import 'package:one_does_project/translations/locale_keys.g.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<LanguageCubit, LanguageState, String>(
      selector: (state) => state.selectedLang,
      builder: (context, selectedLang) {
        return ExpansionTile(
          leading: Icon(LineIcons.globe, color: ColorManager.instance.primary),
          title: Text(
            LocaleKeys.drawer_languageChange.tr(),
            style: getRegularBlackStyle(),
          ),
          textColor: ColorManager.instance.black,
          children: [
            ListTile(
              leading: Image.asset(
                ImagePathManager.instance.turkishFlagsImage,
                height: AppSizeHeight.s30,
                width: AppSizeWidth.s30,
              ),
              title: Text(
                LocaleKeys.drawer_turkish.tr(),
                style: getRegularBlackStyle(),
              ),
              trailing:
                  selectedLang == "tr"
                      ? IconManager.check
                      : SizedBoxManager.instance.shrink,
              onTap: () {
                context.setLocale(const Locale("tr"));
                context.read<LanguageCubit>().changeLanguage(false);
              },
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: Image.asset(
                ImagePathManager.instance.englandFlagsImage,
                height: AppSizeHeight.s30,
                width: AppSizeWidth.s30,
              ),
              title: Text(
                LocaleKeys.drawer_english.tr(),
                style: getRegularBlackStyle(),
              ),
              trailing:
                  selectedLang == "en"
                      ? IconManager.check
                      : SizedBoxManager.instance.shrink,
              onTap: () {
                context.setLocale(const Locale("en"));
                context.read<LanguageCubit>().changeLanguage(true);
              },
            ),
          ],
        );
      },
    );
  }
}
