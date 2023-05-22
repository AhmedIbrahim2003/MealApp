import 'package:flutter/material.dart';
import 'package:meal_app/screens/Category_Meal_Screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({super.key, 
    required this.id,
    required this.title,
    required this.color,
  });

  void selecCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routname, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      onTap: () => selecCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
