import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_notes/controller/language_change_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Language { english, spanish }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        actions: [
          Consumer<LanguageChangeController>(
            builder: (context, provider, child) {
              return PopupMenuButton<Language>(
                onSelected: (Language item) {
                  if (Language.english.name == item.name) {
                    provider.changeLanguage(Locale('en'));
                  } else {
                    provider.changeLanguage(Locale('es'));
                  }
                },
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<Language>>[
                  const PopupMenuItem<Language>(
                    value: Language.english,
                    child: Text('English'),
                  ), // PopupMenuItem
                  const PopupMenuItem<Language>(
                    value: Language.spanish,
                    child: Text('Spanish'),
                  ), // PopupMenuItem
                ], // <PopupMenuEntry<Language>>[]
              ); // PopupMenuButton
            },
          ),
        ],
      ),
    );
  }
}
