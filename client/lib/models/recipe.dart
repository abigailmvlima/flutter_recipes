// lib/models/recipe.dart
class Recipe {
  final String title;
  final String category;
  final List<String> ingredients;
  final String preparation;
  //final String imageUrl;

  Recipe({
    required this.title,
    required this.category,
    required this.ingredients,
    required this.preparation,
    //required this.imageUrl,
  });
}
