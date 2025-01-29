import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  final List<NavigationDestination> appBarDestionations = const [
    NavigationDestination(
      icon: Icon(Icons.upcoming),
      label: 'Upcoming',
      selectedIcon: Icon(Icons.upcoming),
    ),
    NavigationDestination(
      icon: Icon(Icons.history),
      label: "History",
      selectedIcon: Icon(Icons.history),
    ),
    NavigationDestination(
      icon: Icon(Icons.stream),
      label: 'Active',
      selectedIcon: Icon(Icons.stream),
    ),
    NavigationDestination(
      icon: Icon(Icons.person),
      label: 'Profile',
      selectedIcon: Icon(Icons.person),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: appBarDestionations,
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
