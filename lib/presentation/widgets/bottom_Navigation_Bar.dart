import 'package:flutter/material.dart';

import 'package:one_does_project/presentation/book_list/view/book_list_screen.dart';

import 'package:one_does_project/presentation/widgets/icon_text_button.dart';

class NavigateBottomBar extends StatefulWidget {
  const NavigateBottomBar({super.key});

  @override
  State<NavigateBottomBar> createState() => _NavigateBottomBarState();
}

class _NavigateBottomBarState extends State<NavigateBottomBar> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ShapeBorderClipper(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), // Sol üst köşe yuvarlatma
            topRight: Radius.circular(30), // Sağ üst köşe yuvarlatma
          ),
        ),
      ),
      child: BottomAppBar(
        elevation: 5,
        color: Colors.grey[300], // Arka plan rengini ayarlayın
        child: SizedBox(
          height: 70, // Yüksekliği buradan ayarlayın
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconWithTextButton(
                icon: Icons.home_outlined,
                title: "Anasayfa",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
              IconWithTextButton(
                icon: Icons.list_alt,
                title: "Detay",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
              IconWithTextButton(
                icon: Icons.favorite_border,
                title: "Favorilerim",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
