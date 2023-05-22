// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../models/Meal.dart';
import '../screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imgUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  const MealItem({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.id,
    required this.removeItem,
  });

  String get complexityName {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Challenging:
        return 'Challenging';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityName {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routname, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imgUrl),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$duration min",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        complexityName,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        affordabilityName,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
