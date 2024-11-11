import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'views/favorites_view.dart';

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
        // Defina outras rotas conforme necessário
      },
    );
  }
}
