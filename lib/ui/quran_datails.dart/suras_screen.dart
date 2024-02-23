import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/style/app_theme.dart';
import 'package:islami_app/ui/quran_datails.dart/quran_title_widget.dart';
import 'package:provider/provider.dart';

class suras_screen extends StatefulWidget {
  static const String route_name = "suras_screen";
  const suras_screen({super.key});

  @override
  State<suras_screen> createState() => _suras_screenState();
}

class _suras_screenState extends State<suras_screen> {
  @override
  Widget build(BuildContext context) {
    settings_provider provider = Provider.of<settings_provider>(context);
    QuranDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as QuranDetailsArgs;
    if (lines.isEmpty) {
      readQuranFile(args.index);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.themMode == ThemeMode.dark
              ? "assets/image/background_dark.png"
              : "assets/image/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text("اسلامى")),
        body: Card(
          margin: EdgeInsets.all(20),
          elevation: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "سورة ${args.title}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: appTheme.isDark
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.black,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.play_circle,
                    size: 25,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ],
              ),
              Divider(
                  thickness: 2, color: Theme.of(context).colorScheme.secondary),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    "(${index + 1}) ${lines[index].trim()} ",
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  itemCount: lines.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<String> lines = [];
  void readQuranFile(int index) async {
    String readSuras =
        await rootBundle.loadString("assets/suares/${index + 1}.txt");
    lines = readSuras.split("\n");
    setState(() {});
  }
}
