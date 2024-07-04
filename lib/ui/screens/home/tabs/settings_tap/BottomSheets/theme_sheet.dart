import 'package:flutter/material.dart';
import 'package:islami_app/ui/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class theme_sheet extends StatefulWidget {
  const theme_sheet({super.key});

  @override
  State<theme_sheet> createState() => _language_sheetState();
}

class _language_sheetState extends State<theme_sheet> {
  @override
  Widget build(BuildContext context) {
    settings_provider provider = Provider.of<settings_provider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          getSelectedTheme(
              provider.themMode == ThemeMode.light ? "light" : "dark"),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              provider.changeTheme(provider.themMode == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark);
            },
            child: getUnSelectedTheme(
                provider.themMode == ThemeMode.light ? "dark" : "light"),
          ),
        ],
      ),
    );
  }

  Widget getSelectedTheme(String theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(theme, style: Theme.of(context).textTheme.bodyMedium),
        Icon(
          Icons.check,
          size: 30,
          color: Theme.of(context).colorScheme.secondary.withOpacity(1),
        )
      ],
    );
  }

  Widget getUnSelectedTheme(String theme) {
    return Text(
      theme,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
