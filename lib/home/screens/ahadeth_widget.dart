import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/ahadeth_datails/ahadethModel.dart';
import 'package:islami_app/ui/ahadeth_datails/ahadeth_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ahadeth_widget extends StatefulWidget {
  const ahadeth_widget({super.key});

  @override
  State<ahadeth_widget> createState() => _ahadeth_widgetState();
}

class _ahadeth_widgetState extends State<ahadeth_widget> {
  @override
  Widget build(BuildContext context) {
    if (allHadeth.isEmpty) {
      ahadethDetails();
    }
    return Column(
      children: [
        Expanded(child: Image.asset("assets/image/ahadeth_image.png")),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(
            color: Theme.of(context).colorScheme.secondary.withOpacity(1),
            width: 2,
          ))),
          child: Text(
            AppLocalizations.of(context)!.ahadeth,
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 24,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: allHadeth.isEmpty
              ? CircularProgressIndicator()
              : ListView.separated(
                  itemBuilder: (context, index) =>
                      ahadeth_title(hadeth: allHadeth[index]),
                  itemCount: allHadeth.length,
                  separatorBuilder: (context, index) => SizedBox(height: 6),
                  physics: BouncingScrollPhysics(),
                ),
        )
      ],
    );
  }

  List<ahadeth_model> allHadeth = [];

  void ahadethDetails() async {
    String ahadethContent =
        await rootBundle.loadString("assets/suares/ahadeth.txt");
    List<String> hadethList = ahadethContent.trim().split("#");
    for (int i = 0; i < hadethList.length; i++) {
      List<String> oneHadeth = hadethList[i].trim().split("\n");
      String hadethTitle = oneHadeth[0];
      oneHadeth.removeAt(0);
      String ahadethContent = oneHadeth.join(" ");
      allHadeth.add(ahadeth_model(title: hadethTitle, content: ahadethContent));
    }
    setState(() {});
  }
}
