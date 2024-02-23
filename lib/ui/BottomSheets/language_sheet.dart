import 'package:flutter/material.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class language_sheet extends StatefulWidget {
  const language_sheet({super.key});

  @override
  State<language_sheet> createState() => _language_sheetState();
}

class _language_sheetState extends State<language_sheet> {
  @override
  Widget build(BuildContext context) {
    settings_provider provider = Provider.of<settings_provider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          getSelectedLanguage(
              provider.language == "ar" ? "العربية" : "English"),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              provider.changeLanguage(provider.language == "en" ? "ar" : "en");
            },
            child: getUnSelectedLanguage(
                provider.language == "ar" ? "English" : "العربية"),
          ),
        ],
      ),
    );
  }

  Widget getSelectedLanguage(String Language) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(Language, style: Theme.of(context).textTheme.bodyMedium),
        Icon(
          Icons.check,
          size: 30,
          color: Theme.of(context).colorScheme.primary,
        )
      ],
    );
  }

  Widget getUnSelectedLanguage(String Language) {
    return Text(
      Language,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
