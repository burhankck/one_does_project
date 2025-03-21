import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:one_does_project/app/global/theme/view_model/theme_cubit.dart';
import 'package:one_does_project/app/notification/notification_manager.dart';
import 'package:one_does_project/data/model/book_model.dart';
import 'package:one_does_project/data/model/favorite_book_model.dart';
import 'package:one_does_project/main.reflectable.dart';
import 'package:one_does_project/presentation/book_list/view/book_list_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_does_project/presentation/book_list/view_model/book_list_cubit.dart';
import 'package:one_does_project/presentation/detail_book/view_model/detail_book_cubit.dart';
import 'package:one_does_project/presentation/favorite_book/view_model/favorite_book_cubit.dart';
import 'package:one_does_project/presentation/language_change/view_model/language_cubit.dart';
import 'package:one_does_project/presentation/resources/theme_manager.dart';
import 'package:one_does_project/translations/codegen_loader.g.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteBookModelAdapter());
  Hive.registerAdapter(BookModelAdapter());
  Hive.registerAdapter(DatumAdapter());
  Hive.registerAdapter(VillainAdapter());

  await Permission.notification.request();
  await NotificationRepository(navigatorKey: navigatorKey).initNotification();
  await EasyLocalization.ensureInitialized();
  initializeReflectable();
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('tr')],
      path: 'assets/translations',
      fallbackLocale: const Locale('tr'),
      assetLoader: CodegenLoader(),
      saveLocale: true,
      child: Builder(
        builder:
            (context) => MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,

              home: MyApp(preferences: preferences, navigatorKey: navigatorKey),
            ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({
    super.key,
    required this.preferences,
    required this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LanguageCubit(preferences)),

        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => BookListCubit()),
        BlocProvider(create: (_) => BookDetailCubit()),
        BlocProvider(create: (_) => FavoriteBooksCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Tech Task',
                theme: AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
                themeMode: themeMode,
                home: const HomePage(),
                locale: context.locale,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
              );
            },
          );
        },
      ),
    );
  }
}
