const mongoose = require("mongoose");

const categorySchema = new mongoose.Schema(
  {
    description: { type: String, required: true },
  },
  { collection: "category" }
);

module.exports = mongoose.model("category", categorySchema);
