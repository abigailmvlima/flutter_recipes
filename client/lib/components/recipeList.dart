import 'package:flutter/material.dart';

class RecipeList extends StatelessWidget {
  final List<Map<String, String>> recipes;
  final void Function(String recipeName) onTap;

  const RecipeList({
    super.key,
    required this.recipes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Verifica se a lista está vazia e exibe uma mensagem de "sem receitas"
    if (recipes.isEmpty) {
      return Center(
        child: Text(
          'Nenhuma receita disponível',
          style: TextStyle(color: Colors.grey[600], fontSize: 16),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Duas colunas
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio:
            0.8, // Ajuste da proporção para melhor se aproximar do layout desejado
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return GestureDetector(
          onTap: () => onTap(recipe['name'] ?? ''),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(recipe['image'] ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.purple,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                recipe['name'] ?? '',
                style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Sedan'),
              ),
            ],
          ),
        );
      },
    );
  }
}
