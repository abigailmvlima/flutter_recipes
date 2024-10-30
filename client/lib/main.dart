// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/category_screen.dart';

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
      debugShowCheckedModeBanner: false, // Desativa a faixa de debug
      home: const CategoryScreen(),
    );
  }
}
