import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<Map<String, String>> categories;
  final void Function(String categoryName) onTap;

  const CategoryList({
    super.key,
    required this.categories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () => onTap(category['name'] ?? ''),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      category['image'] ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  category['name'] ?? '',
                  style: const TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
