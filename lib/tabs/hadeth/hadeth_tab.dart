import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami/widgets/loading_indicator.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadAhadethFile();
    }
    return Column(
      children: [
        Image.asset('assets/images/hadeth_logo.png'),
        SizedBox(
          height: 18,
        ),
        Expanded(
          child: ahadeth.isEmpty
              ? LoadingIndicator()
              : ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        HadethDetailsScreen.routeName,
                        arguments: ahadeth[index],
                      );
                    },
                    child: Text(
                      ahadeth[index].title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  itemCount: ahadeth.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8,
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> loadAhadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/files/hadeth/ahadeth.txt');
    List<String> ahadethStrings = ahadethFileContent.split('\n#');
    ahadeth = ahadethStrings.map((hadethString) {
      List<String> hadethLines = hadethString.trim().split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return Hadeth(title, content);
    }).toList();
    setState(() {});
  }
}
