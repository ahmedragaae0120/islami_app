import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/home/screens/home_screen.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/style/app_theme.dart';
import 'package:islami_app/ui/ahadeth_datails/hadeth_details_screen.dart';
import 'package:islami_app/ui/quran_datails.dart/suras_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => settings_provider(), child: const islami_app()));
}

class islami_app extends StatelessWidget {
  const islami_app({super.key});

  @override
  Widget build(BuildContext context) {
    settings_provider provider = Provider.of<settings_provider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      locale: provider.language,
      themeMode: provider.themMode,
      theme: appTheme.light_theme,
      darkTheme: appTheme.dark_theme,
      routes: {
        home_screen.route_name: (context) => home_screen(),
        suras_screen.route_name: (context) => const suras_screen(),
        hadeth_details_screen.route_name: (context) =>
            const hadeth_details_screen(),
      },
      initialRoute: home_screen.route_name,
    );
  }
}
