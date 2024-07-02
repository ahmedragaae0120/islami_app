import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaWidget extends StatefulWidget {
  const SebhaWidget({Key? key}) : super(key: key);

  @override
  State<SebhaWidget> createState() => _SebhaWidgetState();
}

class _SebhaWidgetState extends State<SebhaWidget> {
  List<String> tsabeh = [
    "سُبْحَانَ اللَّهِ",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
    "سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ",
    "لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ ",
    "لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلُّ شَيْءِ قَدِيرِ.",
    "الْحَمْدُ للّهِ رَبِّ الْعَالَمِينَ",
    "الْلَّهُم صَلِّ وَسَلِم وَبَارِك عَلَى سَيِّدِنَا مُحَمَّد",
  ];
  int rotate = 0;
  int index_tsbeha = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Image.asset(
                    "assets/image/head_of_seb7a.png",
                    fit: BoxFit.fill,
                    height: 80,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(60),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (rotate == 33) {
                          if (index_tsbeha == tsabeh.length - 1) {
                            index_tsbeha = 0;
                          } else {
                            index_tsbeha++;
                          }
                          rotate = 0;
                        }
                        rotate++;
                        log("$index_tsbeha and rotate $rotate");
                      });
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Transform.rotate(
                      angle: rotate.toDouble(),
                      child: Image.asset(
                        "assets/image/body_of_seb7a.png",
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(AppLocalizations.of(context)!.numberofsebha,
              style: TextStyle(
                  fontSize: 25, color: Theme.of(context).colorScheme.tertiary)),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.80)),
            child: Text("$rotate",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.tertiary,
                )),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.onTertiary),
            child: Text(
              tsabeh[index_tsbeha],
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
