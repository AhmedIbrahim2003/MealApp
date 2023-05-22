import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/Meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routname = 'MealDetailScreen';

  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    final Meal selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            TitleText(context, 'Ingredients'),
            ingredientsAndSteps(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(ctx).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
              150
            ),
            TitleText(context, 'Steps'),
            ingredientsAndSteps(
              ListView.builder(
            itemBuilder: (ctx, index) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${index+1}"),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider()
                ],
              );
            },
            itemCount: selectedMeal.steps.length,
          ),
          275
            )
          ],
        ),
      ),
    );
  }

  Container ingredientsAndSteps(Widget wayOfPrint,double size) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: size,
        width: 300,
        child: wayOfPrint);
  }

  Container TitleText(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
