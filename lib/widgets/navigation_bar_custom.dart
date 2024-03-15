import 'dart:ui';

import 'package:flutter/material.dart';

class NavigationBarCustom extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  const NavigationBarCustom({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: body,
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: NavigationBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.white,
            indicatorColor: Theme.of(context).colorScheme.inversePrimary,
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 6,
            selectedIndex: selectedIndex,
            destinations: const [
              NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
              NavigationDestination(label: 'Search', icon: Icon(Icons.search)),
              NavigationDestination(
                  label: 'Notifications', icon: Icon(Icons.notifications)),
              NavigationDestination(label: 'Profile', icon: Icon(Icons.person)),
            ],
            onDestinationSelected: onDestinationSelected,
          ),
        ),
      ),
    );
  }
}
