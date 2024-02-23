import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/widgets/loading_indicator.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailesArgs args =
        ModalRoute.of(context)!.settings.arguments as SuraDetailesArgs;
    if (ayat.isEmpty) {
      loadSuraFile(args.index);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/default_bg.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.suraName,
            style: GoogleFonts.elMessiri(),
          ),
        ),
        body: ayat.isEmpty
            ? LoadingIndicator()
            : Container(
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.05),
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    ayat[index],
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  itemCount: ayat.length,
                ),
              ),
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String sura =
        await rootBundle.loadString('assets/files/quran/${index + 1}.txt');
    ayat = sura.split('\r\n');
    setState(() {});
  }
}

class SuraDetailesArgs {
  late int index;
  late String suraName;
  SuraDetailesArgs(this.index, this.suraName);
}
