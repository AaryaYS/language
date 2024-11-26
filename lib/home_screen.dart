import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_demo/controller/lang_change.dart'; // Ensure this import is present
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc package

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Language { english, hindi, marathi }

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _signIn() {
    String name = _nameController.text;
    String email = _emailController.text;
    print("Name: $name, Email: $email");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        actions: [
          BlocBuilder<LangCubit, Locale>(
            builder: (context, state) {
              return PopupMenuButton(
                onSelected: (Language item) {
                  if (Language.english.name == item.name) {
                    context.read<LangCubit>().changeLanguage(Locale('en'));
                  } else if (Language.hindi.name == item.name) {
                    context.read<LangCubit>().changeLanguage(Locale('hi'));
                  } else {
                    context.read<LangCubit>().changeLanguage(Locale('mr'));
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
                  const PopupMenuItem(value: Language.english, child: Text("English")),
                  const PopupMenuItem(value: Language.hindi, child: Text("Hindi")),
                  const PopupMenuItem(value: Language.marathi, child: Text("Marathi")),
                ],
              );
            }
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.name,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.email,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _signIn,
              child: Text(AppLocalizations.of(context)!.signIn),
            ),
          ],
        ),
      ),
    );
  }
}
