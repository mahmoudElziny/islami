import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset("assets/images/radio_image.png"),
        Text(
          "اذاعه القران الكريم",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Provider.of<SettingsProvider>(context).themeMode ==
                      ThemeMode.dark
                  ? AppTheme.white
                  : AppTheme.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous_sharp,
              size: 60,
              color: Provider.of<SettingsProvider>(context).themeMode ==
                      ThemeMode.dark
                  ? AppTheme.gold
                  : AppTheme.primaryLight,
            ),
            SizedBox(
              width: 40,
            ),
            Icon(
              Icons.play_arrow_sharp,
              size: 60,
              color: Provider.of<SettingsProvider>(context).themeMode ==
                      ThemeMode.dark
                  ? AppTheme.gold
                  : AppTheme.primaryLight,
            ),
            SizedBox(
              width: 40,
            ),
            Icon(
              Icons.skip_next_sharp,
              size: 60,
              color: Provider.of<SettingsProvider>(context).themeMode ==
                      ThemeMode.dark
                  ? AppTheme.gold
                  : AppTheme.primaryLight,
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
