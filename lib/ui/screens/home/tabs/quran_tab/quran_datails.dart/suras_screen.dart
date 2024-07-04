import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/provider/settings_provider.dart';
import 'package:islami_app/style/app_theme.dart';
import 'package:islami_app/ui/screens/home/tabs/quran_tab/quran_datails.dart/quran_title_widget.dart';
import 'package:provider/provider.dart';

class SurasScreen extends StatefulWidget {
  static const String route_name = "suras_screen";
  const SurasScreen({super.key});

  @override
  State<SurasScreen> createState() => _SurasScreenState();
}

class _SurasScreenState extends State<SurasScreen> {
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
        appBar: AppBar(title: const Text("اسلامى")),
        body: Card(
          margin: const EdgeInsets.all(20),
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
                        color: Theme.of(context).colorScheme.tertiary),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.play_circle,
                    size: 25,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ],
              ),
              Divider(
                  thickness: 3, color: Theme.of(context).colorScheme.secondary),
              Expanded(
                child: lines.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: (context, index) => Text(
                          "${lines[index]}(${index + 1})",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 24,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        itemCount: lines.length,
                      )
                    : const Center(child: CircularProgressIndicator.adaptive()),
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
    lines = readSuras.trim().split("\n");
    setState(() {});
  }
}
