import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:one_does_project/presentation/book_list/view/book_list_screen.dart';
import 'package:one_does_project/presentation/favorite_book/view/favorite_book_screen.dart';
import 'package:one_does_project/presentation/favorite_book/view_model/favorite_book_cubit.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';

import 'package:one_does_project/presentation/widgets/icon_text_button.dart';
import 'package:one_does_project/translations/locale_keys.g.dart';

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
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
      child: BottomAppBar(
        elevation: 5,
        color: ColorManager.instance.grey3,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconWithTextButton(
                icon: Icons.home_outlined,
                title: LocaleKeys.text_home_page.tr(),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),

              IconWithTextButton(
                icon: Icons.favorite_border,
                title: LocaleKeys.text_my_favorite.tr(),
                onTap: () {
                   context.read<FavoriteBooksCubit>().getFavorites();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoriteBooksScreen(),
                    ),
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
