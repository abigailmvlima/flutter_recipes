// lib/models/recipe_data.dart
import 'recipe.dart';

List<Recipe> recipes = [
  Recipe(
    title: "Pastel de Carne",
    category: "Salgado",
    ingredients: ["Carne moída", "Massa de pastel", "Óleo", "Tempero a gosto"],
    preparation:
        "Prepare o recheio com carne e tempero, coloque na massa e frite.",
    //imageUrl: "https://via.placeholder.com/150",
  ),
  Recipe(
    title: "Bolo de Chocolate",
    category: "Doce",
    ingredients: ["Farinha", "Açúcar", "Cacau", "Fermento", "Leite"],
    preparation:
        "Misture os ingredientes e asse em forno pré-aquecido a 180ºC.",
    //imageUrl: "https://via.placeholder.com/150",
  ),
  Recipe(
    title: "Suco de Laranja",
    category: "Bebidas",
    ingredients: ["Laranjas", "Água", "Açúcar a gosto"],
    preparation: "Esprema as laranjas, misture com água e açúcar.",
    //imageUrl: "https://via.placeholder.com/150",
  ),
];
