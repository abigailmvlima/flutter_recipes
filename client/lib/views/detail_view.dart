import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final String recipeId;

  const DetailView({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Receita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detalhes da Receita $recipeId',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // Adicione mais detalhes da receita aqui
            const Text('Descrição da receita...'),
          ],
        ),
      ),
    );
  }
}
