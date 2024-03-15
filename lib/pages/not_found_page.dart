import 'package:flutter/material.dart';
import 'package:flutter_test_go_router/constantes/constantes.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false,
        title: const Text("Not found page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Not found page"),
          const SizedBox(height: 10),
          const Text("This page does not exist"),
          const SizedBox(height: 10),
          TextButton(
              onPressed: () => context.goNamed(home),
              child: const Text("Go to home page"))
        ],
      )),
    );
  }
}
