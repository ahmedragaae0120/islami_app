import 'package:flutter/material.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/ui/ahadeth_datails/ahadethModel.dart';
import 'package:provider/provider.dart';

class hadeth_details_screen extends StatelessWidget {
  static const String route_name = "shadeth_details_screen";
  const hadeth_details_screen({super.key});

  @override
  Widget build(BuildContext context) {
    settings_provider provider = Provider.of<settings_provider>(context);
    ahadeth_model hadethModel =
        ModalRoute.of(context)?.settings.arguments as ahadeth_model;
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
        appBar: AppBar(title: Text("اسلامى")),
        body: Card(
          margin: EdgeInsets.all(20),
          elevation: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                hadethModel.title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              Divider(
                  thickness: 2, color: Theme.of(context).colorScheme.secondary),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    hadethModel.content,
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
