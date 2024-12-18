import 'package:flutter/material.dart';
import 'package:recipes_app/components/navigation_helper.dart';
import 'package:recipes_app/components/recipeList.dart';
import 'package:recipes_app/components/menu.dart';
import 'package:recipes_app/components/header.dart';

class MostAccessedView extends StatefulWidget {
  const MostAccessedView({super.key});

  @override
  MostAccessedViewState createState() => MostAccessedViewState();
}

class MostAccessedViewState extends State<MostAccessedView> {
  int _selectedIndex = 3; // Indica que "Em Alta" está selecionado no Menu

  void _onMenuTap(int index) {
    if (index == _selectedIndex) return; // Evita recarregar a mesma página

    setState(() {
      _selectedIndex = index;
    });

    navigateToPage(context, index);
  }

  @override
  Widget build(BuildContext context) {
    final mostAccessedRecipes = [
      {'name': 'Bolo de Cenoura', 'image': 'assets/images/boloCenoura.png'},
      {'name': 'Panqueca', 'image': 'assets/images/panqueca.png'},
    ];

    return Scaffold(
      appBar: const Header(title: 'Em Alta'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: RecipeList(
          recipes: mostAccessedRecipes,
          onTap: (recipeName) {
            print('Receita selecionada: $recipeName');
          },
        ),
      ),
      bottomNavigationBar: Menu(
        currentIndex: _selectedIndex,
        onTap: _onMenuTap,
      ),
    );
  }
}
