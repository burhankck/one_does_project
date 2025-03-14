import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_does_project/app/view_model/theme_cubit.dart';
import 'package:one_does_project/presentation/book_list/view/book_list_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_does_project/presentation/language_change/view_model/language_cubit.dart';
import 'package:one_does_project/presentation/language_change/view_model/langueage_state.dart';
import 'package:one_does_project/presentation/resources/theme_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // SharedPreferences'i başlat
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('tr')],
      path: 'assets/translations', // Çeviri dosyalarının yolu
      fallbackLocale: const Locale('en'),
      startLocale: Locale(preferences.getString('language') ?? 'tr'),
      child: MyApp(preferences: preferences),
    ),
  );
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;

  const MyApp({super.key, required this.preferences});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Dil için LanguageCubit
        BlocProvider(create: (_) => LanguageCubit(preferences)),
        // Tema için ThemeCubit
        BlocProvider(
          create: (_) => ThemeCubit(), 
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690), 
        builder: (context, child) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, langState) {
              return BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, themeMode) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Tech Task',
                    theme: AppThemes.lightTheme,
                    darkTheme: AppThemes.darkTheme,
                    themeMode: themeMode,
                    home: const HomePage(),
                    locale: Locale(langState.selectedLang),
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
