import 'package:flutter/material.dart';
import 'package:recipes_app/components/categoryList.dart';
import 'package:recipes_app/components/header.dart';
import 'package:recipes_app/components/menu.dart';
import 'package:recipes_app/components/navigation_helper.dart';
import 'package:recipes_app/components/recipeList.dart';
import 'package:recipes_app/components/userDrawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onMenuTap(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    navigateToPage(context, index);
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'Salgados', 'image': 'assets/images/salgados.png'},
      {'name': 'Massas', 'image': 'assets/images/massas.png'},
      {'name': 'Doces', 'image': 'assets/images/doces.png'},
      {'name': 'Bolos', 'image': 'assets/images/bolos.png'},
      {'name': 'Bebidas', 'image': 'assets/images/bebidas.png'},
      {'name': 'Saudáveis', 'image': 'assets/images/saudaveis.png'},
    ];

    final recipes = [
      {'name': 'Bolo de Cenoura', 'image': 'assets/images/boloCenoura.png'},
      {'name': 'Panqueca', 'image': 'assets/images/panqueca.png'},
    ];

    return Scaffold(
      appBar: Header(
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Ação de pesquisa
            },
          ),
        ],
      ),
      drawer:
          const UserDrawer(), // Define o UserDrawer como o drawer do Scaffold
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CategoryList(
                categories: categories,
                onTap: (categoryName) {
                  print('Categoria selecionada: $categoryName');
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Receitas Populares',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RecipeList(
                recipes: recipes,
                onTap: (recipeName) {
                  print('Receita selecionada: $recipeName');
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Menu(
        currentIndex: _selectedIndex,
        onTap: _onMenuTap,
      ),
    );
  }
}
