import '../repository/ingredient_repository.dart';

class IngredientService {
  final IngredientRepository ingredientRepository;

  IngredientService({required this.ingredientRepository});

  Future<List<dynamic>> fetchIngredientsByRecipe(String recipeId) async {
    return await ingredientRepository.getIngredientsByRecipe(recipeId);
  }
}
