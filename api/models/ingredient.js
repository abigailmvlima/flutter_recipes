const mongoose = require("mongoose");
const { modelName } = require("./category");

const ingredientSchema = new mongoose.Schema(
  {
    recipe_id: { type: mongoose.Schema.Types.ObjectId, ref: "recipe" },
    description: { type: String, required: true },
    obs: { type: String },
    unid: { type: String, required: true },
    quantity: { type: Number, required: true },
  },
  { collection: "ingredients" }
);

module.exports = mongoose.model("ingredient", ingredientSchema);
