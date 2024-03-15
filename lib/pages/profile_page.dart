import 'package:flutter/material.dart';
import 'package:flutter_test_go_router/app_rooter.dart';
import 'package:flutter_test_go_router/constantes/constantes.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? currentLocation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentLocation = AppRouter.getCurrentLocation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Profile page"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Current location: $currentLocation"),
            TextButton(
              onPressed: () {
                context.goNamed(settings);
              },
              child: const Text('Go to settings page'),
            ),
          ],
        )));
  }
}
