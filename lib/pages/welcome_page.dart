
import 'package:flutter/material.dart';
import 'package:flutter_test_go_router/constantes/constantes.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Welcome page"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  context.pushNamed(login);
                },
                child: const Text("Go to login page")),
            const SizedBox(height: 10),
            TextButton(
                onPressed: () {
                  context.pushNamed(register);
                },
                child: const Text("Go to register page")),
          ],
        )));
  }
}