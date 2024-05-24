import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  // Attribute
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool clickable = false;

  // Konstruktor
  FormScreen({super.key});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateEmail,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Passwort"),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validatePw,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () {
                clickable ? () {} : null;
              },
              child: const Text("Login"),
            ),
          ]),
        ),
      ),
    );
  }

  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return 'Bitte geben Sie eine Email-Adresse ein';
    } else if (!input.contains('@')) {
      return 'Eine gültige E-Mail muss ein @-Zeichen enthalten';
    } else if (!(input.endsWith('.com') || input.endsWith('.de'))) {
      return 'Die Email muss mit .com oder .de enden';
    }
    return null;
  }

  String? validatePw(String? input) {
    if (input == null || input.isEmpty) {
      return 'Bitte geben Sie ein Passwort ein';
    } else if (input.length < 6 && input.length > 12) {
      return 'Das Passwort muss zwischen 6 und 12 Zeichen lang sein';
    }
    return null;
  }
}
