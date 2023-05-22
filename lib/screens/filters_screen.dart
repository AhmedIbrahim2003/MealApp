import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});
  static const routname = "FilterScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text("Filters"),
      ),
      drawer: MainDrawer(),
    );
  }
}