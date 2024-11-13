import 'package:flutter/material.dart';
import 'package:recipes_app/theme/app_theme.dart';
import 'package:recipes_app/views/add_recipe_view.dart';
import 'package:recipes_app/views/favorites_view.dart';
import 'package:recipes_app/views/home_view.dart';
import 'package:recipes_app/views/measure_converter_view.dart';
import 'package:recipes_app/views/most_accessed_view.dart';
import 'package:recipes_app/views/profile_view.dart';
import 'package:recipes_app/views/splash_screen.dart';

void main() => runApp(const RecipesApp());

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes App',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Define a tela de splash como inicial

      routes: {
        '/home': (context) => const HomeView(),
        '/favorites': (context) => const FavoritesView(),
        '/most_accessed': (context) => const MostAccessedView(),
        '/measure_converter': (context) => const MeasureConverterView(),
        '/add': (context) => const AddRecipeView(),
        '/profile': (context) => const ProfileView(),
      },
    );
  }
}
