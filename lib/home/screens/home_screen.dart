import 'package:flutter/material.dart';
import 'package:islami_app/home/screens/ahadeth_widget.dart';
import 'package:islami_app/home/screens/quran_widget.dart';
import 'package:islami_app/home/screens/radio_widget.dart';
import 'package:islami_app/home/screens/sebha_widget.dart';
import 'package:islami_app/home/screens/settings_wideget.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class home_screen extends StatefulWidget {
  static const String route_name = "home_screen";
  home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int currentNavtIndex = 4;
  List<Widget> naviWidgets = [
    settings_widget(),
    radio_widet(),
    SebhaWidget(),
    ahadeth_widget(),
    quran_widget()
  ];

  @override
  Widget build(BuildContext context) {
    settings_provider provider = Provider.of<settings_provider>(context);
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
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.islami)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentNavtIndex,
          onTap: (index) {
            setState(() {
              currentNavtIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: ImageIcon(AssetImage("assets/image/radio_icon.png")),
              label: AppLocalizations.of(context)!.radio,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: ImageIcon(AssetImage("assets/image/sebha_icon.png")),
              label: AppLocalizations.of(context)!.sebha,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: ImageIcon(AssetImage("assets/image/ahadeth_icon.png")),
              label: AppLocalizations.of(context)!.ahadeth,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: ImageIcon(AssetImage("assets/image/quran_icon.png")),
              label: AppLocalizations.of(context)!.quran,
            )
          ],
        ),
        body: naviWidgets[currentNavtIndex],
      ),
    );
  }
}
