import '../api/api_client.dart';

class RecipeRepository {
  final ApiClient apiClient;

  RecipeRepository({required this.apiClient});

  Future<List<dynamic>> getAllRecipes() async {
    return await apiClient.get('/api/recipes');
  }

  Future<dynamic> createRecipe(Map<String, dynamic> recipeData) async {
    return await apiClient.post('/api/recipes', recipeData);
  }

  Future<dynamic> addIngredientToRecipe(
      String recipeId, Map<String, dynamic> ingredientData) async {
    return await apiClient.post(
        '/api/recipes/$recipeId/ingredients', ingredientData);
  }

  Future<dynamic> deleteIngredientFromRecipe(
      String recipeId, String ingredientId) async {
    return await apiClient
        .delete('/api/recipes/$recipeId/ingredients/$ingredientId');
  }
}
