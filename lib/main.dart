import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/api/api_manager.dart';
import 'package:islami_app/bloc_observer.dart';
import 'package:islami_app/ui/screens/home/home_screen.dart';
import 'package:islami_app/ui/screens/home/tabs/radio_tab/provider/radio_provider.dart';
import 'package:islami_app/ui/provider/settings_provider.dart';
import 'package:islami_app/style/app_theme.dart';
import 'package:islami_app/ui/screens/home/tabs/ahadeth_tab/ahadeth_datails/hadeth_details_screen.dart';
import 'package:islami_app/ui/screens/home/tabs/quran_tab/quran_datails.dart/suras_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/ui/screens/splach/splach_screen.dart';
import 'package:provider/provider.dart';

void main() {
  ApiManager.init();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => settings_provider()..initialize(),
    ),
    ChangeNotifierProvider(
      create: (context) => RadioProvider(),
    )
  ], child: const islami_app()));
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
      locale: Locale(provider.language),
      themeMode: provider.themMode,
      theme: appTheme.light_theme,
      darkTheme: appTheme.dark_theme,
      routes: {
        home_screen.route_name: (context) => const home_screen(),
        SurasScreen.route_name: (context) => const SurasScreen(),
        hadeth_details_screen.route_name: (context) =>
            const hadeth_details_screen(),
        SplachScreen.route_name: (context) => const SplachScreen(),
      },
      initialRoute: SplachScreen.route_name,
    );
  }
}
