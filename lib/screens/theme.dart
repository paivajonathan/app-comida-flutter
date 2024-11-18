import 'package:flutter/material.dart';
import 'package:projeto1/providers/theme.dart';
import 'package:projeto1/screens/filters.dart';
import 'package:projeto1/screens/tabs.dart';
import 'package:projeto1/widgets/filter_switch_tile.dart';
import 'package:projeto1/widgets/main_drawer/main_drawer.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  void _selectDrawerScreen(String identifier) {
    switch (identifier) {
      case "categories":
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const TabsScreen(),
          ),
        );
      case "filters":
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const FiltersScreen(),
          ),
        );
      default:
        Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
      ),
      drawer: MainDrawer(onSelectedScreen: _selectDrawerScreen),
      body: Column(
        children: [
          SwitchTile(
            value: themeProvider.isDarkMode,
            onChanged: (isChecked) {
              setState(() => themeProvider.isDarkMode = isChecked);
            },
            title: "Dark Mode",
            subtitle: "Turns on dark mode for the application.",
          ),
        ],
      ),
    );
  }
}
