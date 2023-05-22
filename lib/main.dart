import 'package:flutter/material.dart';
import 'package:meal_app/screens/Category_Meal_Screen.dart';
import 'package:meal_app/screens/Category_Screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/taps_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.pink,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
            canvasColor: const Color.fromRGBO(255, 254, 229, 1),
            textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1)
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1)
              ),
              titleLarge: const TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed'
              )
            )
      ),
      home: const TapsScreen(),
      routes: {
        'MainPage':(context) => const TapsScreen(),
        CategoryMealScreen.routname:(context) => const CategoryMealScreen(),
        MealDetailScreen.routname:(context) => const MealDetailScreen(),
        FiltersScreen.routname:(context) => const FiltersScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal App"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const CategoriesScreen(),
    );
  }
}
