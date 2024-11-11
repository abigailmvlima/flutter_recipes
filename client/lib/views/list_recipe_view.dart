import 'package:flutter/material.dart';
import 'detail_view.dart';

class ListRecipeView extends StatelessWidget {
  final String categoryId;

  const ListRecipeView({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas da Categoria'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Receita 1'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DetailView(recipeId: '1')),
              );
            },
          ),
          ListTile(
            title: const Text('Receita 2'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DetailView(recipeId: '2')),
              );
            },
          ),
          // Adicione mais receitas conforme necessário
        ],
      ),
    );
  }
}
