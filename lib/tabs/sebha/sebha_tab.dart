import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  List<String> duaa = ['سبحان الله', 'الحمد الله', 'الله اكبر'];
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/head_sebha_logo.png",
                      color: Provider.of<SettingsProvider>(context).themeMode ==
                              ThemeMode.dark
                          ? AppTheme.gold
                          : AppTheme.primaryLight,
                    )),
              ),
              GestureDetector(
                onTap: counterMethod,
                child: Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        "assets/images/body_sebha_logo.png",
                        color:
                            Provider.of<SettingsProvider>(context).themeMode ==
                                    ThemeMode.dark
                                ? AppTheme.gold
                                : AppTheme.primaryLight,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'التسبيح',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                count.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(duaa[index]),
            ),
          ),
        ],
      ),
    );
  }

  void counterMethod() {
    angle += 10;
    if (count == 33) {
      count = 0;
      if (index < duaa.length - 1) {
        index++;
      } else {
        index = 0;
      }
    } else {
      count++;
    }
    setState(() {});
  }
}
