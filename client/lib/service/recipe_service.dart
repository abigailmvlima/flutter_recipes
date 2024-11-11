import '../repository/recipe_repository.dart';

class RecipeService {
  final RecipeRepository recipeRepository;

  RecipeService({required this.recipeRepository});

  Future<List<dynamic>> fetchAllRecipes() async {
    return await recipeRepository.getAllRecipes();
  }

  Future<dynamic> addRecipe(Map<String, dynamic> recipeData) async {
    return await recipeRepository.createRecipe(recipeData);
  }

  Future<dynamic> addIngredient(
      String recipeId, Map<String, dynamic> ingredientData) async {
    return await recipeRepository.addIngredientToRecipe(
        recipeId, ingredientData);
  }

  Future<dynamic> removeIngredient(String recipeId, String ingredientId) async {
    return await recipeRepository.deleteIngredientFromRecipe(
        recipeId, ingredientId);
  }
}
