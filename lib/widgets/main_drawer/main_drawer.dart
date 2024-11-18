import 'package:flutter/material.dart';
import 'package:projeto1/widgets/main_drawer/main_drawer_header.dart';
import 'package:projeto1/widgets/main_drawer/main_drawer_list_tile.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onSelectedScreen,
  });

  final void Function(String) onSelectedScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const MainDrawerHeader(),
          MainDrawerListTile(
            title: "Categories",
            icon: Icons.restaurant,
            onTap: () {
              onSelectedScreen("categories");
            },
          ),
          MainDrawerListTile(
            title: "Filters",
            icon: Icons.settings,
            onTap: () {
              onSelectedScreen("filters");
            },
          )
        ],
      ),
    );
  }
}
