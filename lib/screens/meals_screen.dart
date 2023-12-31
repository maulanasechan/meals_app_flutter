import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreeen extends StatelessWidget {
  const MealsScreeen({
    super.key,
    this.title,
    required this.meals,
    // required this.onToggleFavorite,
  });

  final String? title;
  final List<Meal> meals;

  // final void Function(Meal meal) onToggleFavorite;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MealDetailScreen(meal: meal),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting other category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            onSelectMeal: () {
              _selectMeal(context, meals[index]);
            }),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
