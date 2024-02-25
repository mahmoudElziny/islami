import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SettingsProvider(),
      child: Builder(
        builder: (BuildContext context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
            HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
          },
          initialRoute: HomeScreen.routeName,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: Provider.of<SettingsProvider>(context).themeMode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(Provider.of<SettingsProvider>(context).languageCode),
        ),
      ),
    );
  }
}
