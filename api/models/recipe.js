const mongoose = require("mongoose");

const recipeSchema = new mongoose.Schema(
  {
    category_id: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "category",
      required: true,
    },
    description: { type: String, required: true },
    ingredients: [{ type: mongoose.Schema.Types.ObjectId, ref: "ingredient" }],
    howtomake: { type: String, required: true },
    observations: { type: String },
  },
  { collection: "recipe" }
);

module.exports = mongoose.model("recipe", recipeSchema);
