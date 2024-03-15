import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_go_router/app_rooter.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:upgrader/upgrader.dart';

void main() {
  if (kIsWeb) {
    usePathUrlStrategy();
    // ensure URL changes in the address bar when using push / pushNamed
    GoRouter.optionURLReflectsImperativeAPIs = true;
  }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final testUpgraderAlert = false;

  @override
  Widget build(BuildContext context) {
    //tests upgrader
    const appcastURL =
        'https://raw.githubusercontent.com/larryaasen/upgrader/master/test/testappcast.xml';
    final cfg = AppcastConfiguration(url: appcastURL, supportedOS: ['android']);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter test go router',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.goRouter,
      builder: (context, child) {
        if (!kIsWeb && testUpgraderAlert) {
          return UpgradeAlert(
            upgrader: Upgrader(
              appcastConfig: cfg,
              dialogStyle: Platform.isIOS
                  ? UpgradeDialogStyle.cupertino
                  : UpgradeDialogStyle.material,
              messages: UpgraderMessages(code: 'fr'),
            ),
            navigatorKey: AppRouter.goRouter.routerDelegate.navigatorKey,
            child: child,
          );
        }
        return child ?? const SizedBox();
      },
    );
  }
}
