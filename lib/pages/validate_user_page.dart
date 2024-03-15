import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ValidateUserPage extends StatefulWidget {
  const ValidateUserPage({super.key});

  @override
  State<ValidateUserPage> createState() => _ValidateUserPageState();
}

class _ValidateUserPageState extends State<ValidateUserPage> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => context.pop(),
          ),
          title: const Text("Validate user page"),
        ),
        body: const Center(
          child: Text("Validate user page"),
        ));
  }
}
