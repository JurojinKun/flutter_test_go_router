import 'package:flutter/material.dart';
import 'package:flutter_test_go_router/constantes/constantes.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Search page"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.goNamed(activities);
          },
          child: const Text('Go to activities page'),
        )
      )
    );
  }
}