
import 'package:flutter/material.dart';

class NavigationRailCustom extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  const NavigationRailCustom({super.key, required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                label: Text('Home'),
                icon: Icon(Icons.home),
              ),
              NavigationRailDestination(
                label: Text('Search'),
                icon: Icon(Icons.search),
              ),
              NavigationRailDestination(
                label: Text('Notifications'),
                icon: Icon(Icons.notifications),
              ),
              NavigationRailDestination(
                label: Text('Profile'),
                icon: Icon(Icons.person),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}