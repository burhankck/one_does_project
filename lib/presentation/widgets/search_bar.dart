import 'package:flutter/material.dart';
import 'package:one_does_project/presentation/resources/decoration_manager.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';

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
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      controller: searchTextController,
      style: getBoldBlackStyle(),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Arama Yapınız',
        suffixIcon: InkWell(
          onTap: () {
            if (searchTextController != null) {
              searchTextController!.clear();
            }
            if (onChanged != null) {
              onChanged!(""); //
            }
            FocusScope.of(context).unfocus();
          },
          child: const Icon(Icons.close),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadiusManager.instance.all12,
        ),
      ),
    );
  }
}
