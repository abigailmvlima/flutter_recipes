const express = require("express");
const router = express.Router();
const Recipe = require("../models/recipe");
const Ingredient = require("../models/ingredient"); // Importação corrigida

// Create a new recipe (sem ingredientes)
router.post("/", async (req, res) => {
  const { category_id, description, howtomake, observations } = req.body;
  const recipe = new Recipe({
    category_id,
    description,
    howtomake,
    observations,
  });

  try {
    const savedRecipe = await recipe.save();
    res.status(201).json(savedRecipe);
  } catch (error) {
    res.status(400).json({ error });
  }
});

// Get all recipes with their ingredients
router.get("/", async (req, res) => {
  try {
    // Buscar todas as receitas e popular apenas o campo category_id
    const recipes = await Recipe.find().populate("category_id");

    // Para cada receita, buscar e associar os ingredientes correspondentes
    const recipesWithIngredients = await Promise.all(
      recipes.map(async (recipe) => {
        const ingredients = await Ingredient.find({ recipe_id: recipe._id });
        return {
          ...recipe.toObject(), // Converte o documento da receita em um objeto comum
          ingredients: ingredients, // Associa os ingredientes correspondentes
        };
      })
    );

    res.json(recipesWithIngredients);
  } catch (error) {
    res.status(500).json({ error });
  }
});

// Get a single recipe by ID
router.get("/:id", async (req, res) => {
  try {
    // Buscar a receita pelo ID e popular a categoria
    const recipe = await Recipe.findById(req.params.id).populate("category_id");

    if (!recipe) {
      return res.status(404).json({ message: "Recipe not found" });
    }

    // Buscar ingredientes associados ao recipe_id
    const ingredients = await Ingredient.find({ recipe_id: recipe._id });

    // Adicionar os ingredientes ao objeto da receita
    const recipeWithIngredients = {
      ...recipe.toObject(), // Converte o documento Mongoose em um objeto comum
      ingredients: ingredients, // Insere o array de ingredientes
    };

    res.json(recipeWithIngredients);
  } catch (error) {
    res.status(500).json({ error });
  }
});

// Update a recipe by ID
router.put("/:id", async (req, res) => {
  try {
    const updatedRecipe = await Recipe.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    ).populate("category_id ingredients");
    res.json(updatedRecipe);
  } catch (error) {
    res.status(400).json({ error });
  }
});

// Delete a recipe by ID
router.delete("/:id", async (req, res) => {
  try {
    await Recipe.findByIdAndDelete(req.params.id);
    res.json({ message: "Recipe deleted" });
  } catch (error) {
    res.status(500).json({ error });
  }
});

// Get all ingredients by recipe ID
router.get("/ingredients/:recipe_id", async (req, res) => {
  try {
    const ingredients = await Ingredient.find({
      recipe_id: req.params.recipe_id,
    });
    res.json(ingredients);
  } catch (error) {
    res.status(500).json({ error });
  }
});

// Add an ingredient to a specific recipe
router.post("/:recipe_id/ingredients", async (req, res) => {
  const { recipe_id } = req.params;
  const { description, obs, unid, quantity } = req.body;

  const ingredient = new Ingredient({
    recipe_id,
    description,
    obs,
    unid,
    quantity,
  });

  try {
    const savedIngredient = await ingredient.save();
    res.status(201).json(savedIngredient);
  } catch (error) {
    res.status(400).json({ error });
  }
});

// Delete an ingredient by recipe ID and ingredient ID
router.delete("/:recipe_id/ingredients/:ingredient_id", async (req, res) => {
  const { recipe_id, ingredient_id } = req.params;

  try {
    // Verificar se o ingrediente pertence à receita
    const ingredient = await Ingredient.findOne({
      _id: ingredient_id,
      recipe_id,
    });

    if (!ingredient) {
      return res
        .status(404)
        .json({ message: "Ingredient not found for this recipe" });
    }

    // Excluir o ingrediente
    await Ingredient.findByIdAndDelete(ingredient_id);

    res.json({ message: "Ingredient deleted" });
  } catch (error) {
    res.status(500).json({ error });
  }
});

module.exports = router;
