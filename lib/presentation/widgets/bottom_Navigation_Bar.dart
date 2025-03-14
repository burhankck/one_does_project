import 'package:flutter/material.dart';
import 'package:one_does_project/presentation/resources/image_path_manager.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';

class BottomNavigateBar extends StatefulWidget {
  const BottomNavigateBar({super.key});

  @override
  State<BottomNavigateBar> createState() => _BottomNavigateBarState();
}

class _BottomNavigateBarState extends State<BottomNavigateBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 5,
      child: Wrap(
        children: [
          Row(
            children: [
              const SizedBox(width: 5),
              Expanded(
                child: Wrap(
                  children: [
                    Text("Kitap Dünyası", style: getBoldPrimaryStyle()),
                  ],
                ),
              ),
              Container(
                width: 45,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Image(
                  image: AssetImage(ImagePathManager.instance.bookImage),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
