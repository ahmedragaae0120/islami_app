import 'package:flutter/material.dart';
import 'package:islami_app/ui/provider/settings_provider.dart';
import 'package:islami_app/ui/screens/home/tabs/settings_tap/BottomSheets/language_sheet.dart';
import 'package:islami_app/ui/screens/home/tabs/settings_tap/BottomSheets/theme_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class settings_widget extends StatefulWidget {
  const settings_widget({super.key});
  @override
  State<settings_widget> createState() => _settings_widgetState();
}

class _settings_widgetState extends State<settings_widget> {
  @override
  Widget build(BuildContext context) {
    settings_provider provider = Provider.of<settings_provider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                provider.language == "ar" ? "العربية" : "English",
                style: TextStyle(
                  fontSize: 24,
                  color:
                      Theme.of(context).colorScheme.onSecondary.withOpacity(1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.thems,
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                provider.themMode == ThemeMode.light ? "light" : "dark",
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showBottomSheet(
      context: context,
      builder: (context) {
        return language_sheet();
      },
    );
  }

  void showThemeBottomSheet() {
    showBottomSheet(context: context, builder: (context) => theme_sheet());
  }
}
