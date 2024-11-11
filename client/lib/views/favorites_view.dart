import 'package:flutter/material.dart';
import 'package:recipes_app/components/header.dart';
import 'package:recipes_app/components/menu.dart';
import 'package:recipes_app/components/recipeList.dart';
import 'package:recipes_app/utils/route_utils.dart';
import 'package:recipes_app/views/home_view.dart'; // Importe o arquivo de utilidades

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends State<FavoritesView> {
  int _selectedIndex = 1; // Indica que "Favoritos" está selecionado no Menu

  void _onMenuTap(int index) {
    if (index == _selectedIndex) return; // Evita recarregar a mesma página

    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.pushReplacement(context, createBlurRoute(const HomeView()));
      }
      // Adicione outras navegações conforme necessário
      // if (index == 2) Navigator.pushReplacement(context, createBlurRoute(const AddView()));
      // if (index == 3) Navigator.pushReplacement(context, createBlurRoute(const TrendingView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteRecipes = [
      {'name': 'Bolo de Cenoura', 'image': 'assets/images/boloCenoura.png'},
      {'name': 'Bolo de Cenoura', 'image': 'assets/images/boloCenoura.png'},
    ];

    return Scaffold(
      appBar: const Header(title: 'Favoritos'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: RecipeList(
          recipes: favoriteRecipes,
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
