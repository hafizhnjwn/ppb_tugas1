import 'package:flutter/material.dart';

class RecipeList {
  String name;
  String text;
  String iconPath;
  Color boxColor; // New field
  bool viewIsSelected; // New field

  RecipeList({
    required this.name,
    required this.text,
    required this.iconPath,
    required this.boxColor, // New parameter
    required this.viewIsSelected, // Initialize to false
  });

  static List<RecipeList> getRecipes() {
    List<RecipeList> recipe = [];
    List<Color> colors = [Colors.green[200]!]; // Colors for every 3 containers

    recipe.add(
      RecipeList(
        name: 'Blueberry Pancakes',
        text: '''1 cup (125g) all-purpose flour
        1 tbsp sugar (optional, for sweetness)
        1 tsp baking powder
        ½ tsp baking soda
        ¼ tsp salt
        ¾ cup (180ml) milk (or buttermilk for fluffier pancakes)
        1 large egg
        2 tbsp melted butter (or oil)
        ½ cup (75g) fresh or frozen blueberries
        Butter or oil (for cooking)''',
        iconPath: 'assets/icons/blueberry-pancake.svg',
        boxColor: colors[0], // Assign color
        viewIsSelected: true, // Set to false
      ),
    );

    recipe.add(
      RecipeList(
        name: 'Canai Bread',
        text: '''1 cup (125g) all-purpose flour
        1 tbsp sugar (optional, for sweetness)
        1 tsp baking powder
        ½ tsp baking soda
        ¼ tsp salt
        ¾ cup (180ml) milk (or buttermilk for fluffier pancakes)
        1 large egg
        2 tbsp melted butter (or oil)
        Butter or oil (for cooking)''',
        iconPath: 'assets/icons/canai-bread.svg',
        boxColor: colors[0], // Assign color
        viewIsSelected: false, // Set to false
      ),
    );

    recipe.add(
      RecipeList(
        name: 'Honey Pancakes',
        text: '''1 cup (125g) all-purpose flour
        1 tbsp sugar (optional, for sweetness)
        1 tsp baking powder
        ½ tsp baking soda
        ¼ tsp salt
        ¾ cup (180ml) milk (or buttermilk for fluffier pancakes)
        1 large egg
        2 tbsp melted butter (or oil)
        Butter or oil (for cooking)''',
        iconPath: 'assets/icons/honey-pancakes.svg',
        boxColor: colors[0], // Assign color
        viewIsSelected: false, // Set to false
      ),
    );

    recipe.add(
      RecipeList(
        name: 'Pancakes',
        text: '''1 cup (125g) all-purpose flour
        1 tbsp sugar (optional, for sweetness)
        1 tsp baking powder
        ½ tsp baking soda
        ¼ tsp salt
        ¾ cup (180ml) milk (or buttermilk for fluffier pancakes)
        1 large egg
        2 tbsp melted butter (or oil)
        Butter or oil (for cooking)''',
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: colors[0], // Assign color
        viewIsSelected: false, // Set to false
      ),
    );

    recipe.add(
      RecipeList(
        name: 'Pie',
        text: '''1 cup (125g) all-purpose flour
        1 tbsp sugar (optional, for sweetness)
        1 tsp baking powder
        ½ tsp baking soda
        ¼ tsp salt
        ¾ cup (180ml) milk (or buttermilk for fluffier pancakes)
        1 large egg
        2 tbsp melted butter (or oil)
        Butter or oil (for cooking)''',
        iconPath: 'assets/icons/pie.svg',
        boxColor: colors[0], // Assign color
        viewIsSelected: false, // Set to false
      ),
    );

    recipe.add(
      RecipeList(
        name: 'Salmon Nigiri',
        text: '''1 cup (125g) all-purpose flour
        1 tbsp sugar (optional, for sweetness)
        1 tsp baking powder
        ½ tsp baking soda
        ¼ tsp salt
        ¾ cup (180ml) milk (or buttermilk for fluffier pancakes)
        1 large egg
        2 tbsp melted butter (or oil)
        Butter or oil (for cooking)''',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        boxColor: colors[0], // Assign color
        viewIsSelected: false, // Set to false
      ),
    );

    return recipe;
  }
}