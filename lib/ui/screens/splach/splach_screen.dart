import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/ui/provider/settings_provider.dart';
import 'package:islami_app/ui/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class SplachScreen extends StatefulWidget {
  static const String route_name = "SplachScreen";
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, home_screen.route_name));
  }

  @override
  Widget build(BuildContext context) {
    settings_provider providerSettings =
        Provider.of<settings_provider>(context);
    return Image.asset(
      providerSettings.themMode == ThemeMode.dark
          ? "assets/image/splashDark.png"
          : "assets/image/splash.png",
      fit: BoxFit.fill,
    );
  }
}
