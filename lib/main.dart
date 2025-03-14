import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_does_project/presentation/book_list/view/book_list_screen.dart';
import 'package:easy_localization/easy_localization.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_does_project/presentation/language_change/view_model/language_cubit.dart';
import 'package:one_does_project/presentation/language_change/view_model/langueage_state.dart';
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
    return BlocProvider(
      create: (_) => LanguageCubit(preferences),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Tech Task',
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                home: const HomePage(),
                locale: Locale(state.selectedLang), // Dil ayarı buradan alınır
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