import 'package:flutter/material.dart';
import 'package:recipes_app/views/favorites_view.dart';
import 'package:recipes_app/views/home_view.dart';
import 'package:recipes_app/views/most_accessed_view';

void main() => runApp(const RecipesApp());

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeView(),
        '/favorites': (context) => const FavoritesView(),
        '/most_accessed': (context) => const MostAccessedView(),
        // Defina outras rotas conforme necessário
      },
    );
  }
}
