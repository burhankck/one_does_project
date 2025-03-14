import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';
import 'package:one_does_project/presentation/resources/image_path_manager.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';
import 'package:one_does_project/presentation/widgets/appbar_menu.dart';
import 'package:one_does_project/presentation/widgets/bottom_Navigation_Bar.dart';
import 'package:one_does_project/presentation/widgets/drawer_menu.dart';
import 'package:one_does_project/presentation/widgets/list_tile_card.dart';
import 'package:one_does_project/presentation/widgets/search_bar.dart';
import 'package:one_does_project/translations/locale_keys.g.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
  ];
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = _items;
      } else {
        _filteredItems =
            _items
                .where(
                  (item) => item.toLowerCase().contains(query.toLowerCase()),
                )
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTitle(
        title: Text(
          LocaleKeys.appBar_bookListAppBar.tr(),
          style: getBoldPrimaryStyleTitle(),
        ),
      ),
      drawer: DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBars(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return CustomListTileCard(
                    title: "Kitap Adı",
                    leading: Padding(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 5),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(ImagePathManager.instance.bookImage),
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                    subTitle: Text("Kitap SubTitle"),
                    visualDensity: VisualDensity.compact,
                    trailing: Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: ColorManager.instance.primary,
                            ),
                            onPressed: () {
                              // Favori ekleme işlemi yapılabilir
                              // Örneğin, bir state değişikliği ya da favori listesi eklenebilir
                            },
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ConstantSearchBar _buildSearchBars() {
    return ConstantSearchBar(
      searchTextController: _searchController,
      onChanged: (p0) {},
    );
  }
}
