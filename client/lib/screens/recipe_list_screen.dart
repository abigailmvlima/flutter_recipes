// lib/screens/recipe_list_screen.dart
import 'package:flutter/material.dart';
import '../models/recipe_data.dart';
import 'recipe_detail_screen.dart';

class RecipeListScreen extends StatelessWidget {
  final String category;

  const RecipeListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Filtra as receitas com base na categoria selecionada
    final categoryRecipes =
        recipes.where((recipe) => recipe.category == category).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: ListView.builder(
        itemCount: categoryRecipes.length,
        itemBuilder: (context, index) {
          final recipe = categoryRecipes[index];
          return ListTile(
            //leading: Image.network(recipe.imageUrl),
            title: Text(recipe.title),
            onTap: () {
              // Navega para a tela de detalhes da receita
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipe: recipe),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
