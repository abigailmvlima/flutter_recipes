const express = require("express");
const router = express.Router();
const Ingredient = require("../models/ingredient");

// Create a new ingredient
router.post("/", async (req, res) => {
  const ingredient = new Ingredient(req.body);
  try {
    const savedIngredient = await ingredient.save();
    res.status(201).json(savedIngredient);
  } catch (error) {
    res.status(400).json({ error });
  }
});

// Get all ingredients
router.get("/", async (req, res) => {
  try {
    const ingredients = await Ingredient.find();
    res.json(ingredients);
  } catch (error) {
    res.status(500).json({ error });
  }
});

// Get a single recipe by ID, including its ingredients
router.get("/:id", async (req, res) => {
  try {
    // Encontrar a receita pelo ID e popular apenas o campo da categoria
    const recipe = await Recipe.findById(req.params.id).populate("category_id");

    if (!recipe) {
      return res.status(404).json({ message: "Recipe not found" });
    }

    // Buscar ingredientes que tenham o recipe_id correspondente
    const ingredients = await Ingredient.find({ recipe_id: recipe._id });

    // Adicionar os ingredientes ao objeto da receita antes de enviá-lo na resposta
    const recipeWithIngredients = {
      ...recipe.toObject(), // Converte o documento Mongoose em um objeto normal
      ingredients: ingredients, // Adiciona o array de ingredientes
    };

    res.json(recipeWithIngredients);
  } catch (error) {
    res.status(500).json({ error });
  }
});

// Update an ingredient by ID
router.put("/:id", async (req, res) => {
  try {
    const updatedIngredient = await Ingredient.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    res.json(updatedIngredient);
  } catch (error) {
    res.status(400).json({ error });
  }
});

// Delete an ingredient by ID
router.delete("/:id", async (req, res) => {
  try {
    await Ingredient.findByIdAndDelete(req.params.id);
    res.json({ message: "Ingredient deleted" });
  } catch (error) {
    res.status(500).json({ error });
  }
});

module.exports = router;
