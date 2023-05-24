// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories"),backgroundColor: Theme.of(context).primaryColor,),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisExtent: 150,
        ),
        children: getList(),
      ),
    );
  }

  List<Widget> getList() {
    List<Widget> childs = DUMMY_CATEGORIES
        .map(
          (e) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryItem(id: e.id, title: e.title, color: e.color),
          ),
        )
        .toList();
    return childs;
  }
}
