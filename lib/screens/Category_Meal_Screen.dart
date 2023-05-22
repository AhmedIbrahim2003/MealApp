// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:meal_app/models/Meal.dart';
import 'package:meal_app/widgets/Meal_Item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routname = 'Category_Meal_Screen';

  const CategoryMealScreen({super.key});
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  void _removeMeal(String mealId){
    
  }

  
  @override
  Widget build(BuildContext context) {
    final routArg = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routArg['id'];
    final categoryTitle = routArg['title'];
    final displayMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
      
    
    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryTitle Recipes"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            imgUrl: displayMeals[index].imageUrl,
            title: displayMeals[index].title,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            id: displayMeals[index].id, 
            removeItem: _removeMeal,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}