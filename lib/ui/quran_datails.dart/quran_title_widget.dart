import 'package:flutter/material.dart';
import 'package:islami_app/ui/quran_datails.dart/suras_screen.dart';

class quran_title_widget extends StatelessWidget {
  final String title;
  final String versesNumber;
  final int index;
  const quran_title_widget(
      {super.key,
      required this.title,
      required this.versesNumber,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(suras_screen.route_name,
            arguments: QuranDetailsArgs(title: title, index: index));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              versesNumber,
              style: TextStyle(
                  fontSize: 24, color: Theme.of(context).colorScheme.tertiary),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.secondary.withOpacity(1),
            height: 45,
            width: 4,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 24, color: Theme.of(context).colorScheme.tertiary),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class QuranDetailsArgs {
  String title;
  int index;
  QuranDetailsArgs({required this.title, required this.index});
}
