import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:one_does_project/presentation/resources/decoration_manager.dart';
import 'package:one_does_project/translations/locale_keys.g.dart';

class ConstantSearchBar extends StatelessWidget {
  const ConstantSearchBar({
    super.key,
    required this.onChanged,
    required this.searchTextController,
  });
  final Function(String)? onChanged;
  final TextEditingController? searchTextController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        onChanged!(value);
      },
      controller: searchTextController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: LocaleKeys.textField_search.tr(),
        suffixIcon: InkWell(
          onTap: () {
            if (searchTextController != null) {
              searchTextController!.clear();
            }
            onChanged!("");
            FocusScope.of(context).unfocus();
          },
          child: const Icon(Icons.close),
        ),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadiusManager.instance.all12, // Yuvarlatılmış köşeler
        ),
      ),
    );
  }
}
