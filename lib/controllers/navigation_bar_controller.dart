import 'package:flutter/material.dart';
import 'package:flutter_test_go_router/widgets/navigation_bar_custom.dart';
import 'package:flutter_test_go_router/widgets/navigation_rail_custom.dart';
import 'package:go_router/go_router.dart';

class NavigationBarController extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const NavigationBarController({super.key, required this.navigationShell});

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        return NavigationBarCustom(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      } else {
        return NavigationRailCustom(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      }
    });
  }
}