import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<Language> languges = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربيه', code: 'ar')
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.darkMode,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Switch(
                value: settingsProvider.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  if (value) {
                    settingsProvider.changeTheme(ThemeMode.dark);
                  } else {
                    settingsProvider.changeTheme(ThemeMode.light);
                  }
                },
                activeTrackColor: Theme.of(context).primaryColor,
                inactiveTrackColor: Theme.of(context).primaryColor,
                thumbColor: MaterialStatePropertyAll(AppTheme.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<Language>(
                  value: languges.firstWhere(
                      (element) =>
                          element.code == settingsProvider.languageCode,
                      orElse: () => languges.first),
                  items: languges
                      .map(
                        (e) => DropdownMenuItem<Language>(
                          child: Text(
                            e.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          value: e,
                        ),
                      )
                      .toList(),
                  onChanged: (selectedValue) {
                    if (selectedValue != null) {
                      settingsProvider.changeLanguage(selectedValue.code);
                    }
                  },
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Language {
  String name;
  String code;

  Language({required this.name, required this.code});
}
