import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.secondary,
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Text(
                "Cooking app!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildListTile(
              Icon(Icons.restaurant, size: 26),
              "Meal",
              "MainPage",
              context,
            ),
            buildListTile(
              Icon(Icons.settings),
              "Filters",
              FiltersScreen.routname,
              context,
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(
      Icon icon, String text, String route, BuildContext ctx) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
      ),
      onTap: () => drawerNav(ctx, route),
    );
  }

  void drawerNav(BuildContext ctx, String routName) {
    Navigator.of(ctx).pushReplacementNamed(
      routName,
    );
  }
}
