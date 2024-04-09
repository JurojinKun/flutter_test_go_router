import 'package:flutter/material.dart';
import 'package:flutter_test_go_router/constantes/constantes.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.pop();
            },
          ),
          title: const Text("Login page"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString("token", "tokenTest").then((value) => context.goNamed(home));
                },
                child: const Text("Login")),
            const SizedBox(height: 10),
            TextButton(
                onPressed: () {
                  context.pushNamed(forgotPassword);
                },
                child: const Text("Go to forgot password page")),
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
