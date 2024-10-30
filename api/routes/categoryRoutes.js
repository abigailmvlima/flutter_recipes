const express = require("express");
const router = express.Router();
const Category = require("../models/category");

// Create
router.post("/", async (req, res) => {
  const category = new Category(req.body);
  try {
    const savedCategory = await category.save();
    res.status(201).json(savedCategory);
  } catch (error) {
    res.status(400).json({ error });
  }
});

// Read
router.get("/", async (req, res) => {
  try {
    const categories = await Category.find();
    res.json(categories);
  } catch (error) {
    res.status(500).json({ error });
  }
});

// Read
router.get("/:id", async (req, res) => {
  try {
    const categories = await Category.findById(req.params.id);
    res.json(categories);
  } catch (error) {
    res.status(500).json({ error });
  }
});

// Update
router.put("/:id", async (req, res) => {
  try {
    const updatedCategory = await Category.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    res.json(updatedCategory);
  } catch (error) {
    res.status(400).json({ error });
  }
});

// Delete
router.delete("/:id", async (req, res) => {
  try {
    await Category.findByIdAndDelete(req.params.id);
    res.json({ message: "Category deleted" });
  } catch (error) {
    res.status(500).json({ error });
  }
});

module.exports = router;
