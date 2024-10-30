// lib/screens/category_screen.dart
import 'package:flutter/material.dart';
import 'recipe_list_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categorias')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        children: const [
          CategoryTile(category: "Salgado"),
          CategoryTile(category: "Doce"),
          CategoryTile(category: "Bebidas"),
        ],
      ),
    );
  }
}

class CategoryTile extends StatefulWidget {
  final String category;

  const CategoryTile({super.key, required this.category});

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeListScreen(category: widget.category),
          ),
        );
      },
      child: Card(
        child: Center(
          child: Text(
            widget.category,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
