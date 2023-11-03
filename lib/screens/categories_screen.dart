import 'package:flutter/material.dart';

import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    // required this.onToggleFavorite,
    required this.availableMeals,
  });

  // final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    // Navigator.of(context).push(route) same as
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreeen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
      // const [
      //   Text(
      //     '1',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   Text(
      //     '2',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   Text(
      //     '3',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   Text(
      //     '4',
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ],
    );
  }
}
