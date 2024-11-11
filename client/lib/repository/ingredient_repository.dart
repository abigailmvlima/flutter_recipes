import '../api/api_client.dart';

class IngredientRepository {
  final ApiClient apiClient;

  IngredientRepository({required this.apiClient});

  Future<List<dynamic>> getIngredientsByRecipe(String recipeId) async {
    return await apiClient.get('/api/recipes/$recipeId/ingredients');
  }
}
