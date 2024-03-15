import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_go_router/app_rooter.dart';
import 'package:flutter_test_go_router/constantes/constantes.dart';
import 'package:flutter_test_go_router/pages/validate_user_page.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future _validateUserBottomSheet(BuildContext context) async {
    return Platform.isAndroid
        ? showMaterialModalBottomSheet(
            context: context,
            expand: true,
            enableDrag: false,
            builder: (context) {
              return const ValidateUserPage();
            })
        : showCupertinoModalBottomSheet(
            context: context,
            expand: true,
            enableDrag: false,
            builder: (context) {
              return const ValidateUserPage();
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home page"),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              if (kIsWeb) {
                context.goNamed(validateUser);
              } else {
                _validateUserBottomSheet(AppRouter.rootNavigatorKey.currentContext!);
              }
            },
            child: const Text("Go to validate user")),
      ),
    );
  }
}
