import 'package:flutter/material.dart';
import 'package:meal_app/screens/Category_Screen.dart';
import 'package:meal_app/screens/fav_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TapsScreen extends StatefulWidget {
  const TapsScreen({super.key});

  @override
  State<TapsScreen> createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  var _pages = [
    {
      'page': const CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': const FavoritesScreen(),
      'title': 'Your Favorites',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  void initState() {
    super.initState();
    final pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': const FavoritesScreen(),
        'title': 'Your Favorites',
      },
    ];
    _pages = pages;
  }

  @override
  Widget build(BuildContext context) {
    final pages = _pages.map((page) => page['page'] as Widget).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("${_pages[_selectedPageIndex]['title']}"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: IndexedStack(
        index: _selectedPageIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
