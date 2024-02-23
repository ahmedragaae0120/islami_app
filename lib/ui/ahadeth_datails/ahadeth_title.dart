import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/ahadeth_datails/ahadethModel.dart';
import 'package:islami_app/ui/ahadeth_datails/hadeth_details_screen.dart';

class ahadeth_title extends StatelessWidget {
  final ahadeth_model hadeth;
  const ahadeth_title({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(hadeth_details_screen.route_name, arguments: hadeth);
      },
      child: Text(
        hadeth.title,
        style: TextStyle(
          fontSize: 20,
          color: Theme.of(context).colorScheme.tertiary,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
