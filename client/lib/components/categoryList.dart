import 'package:flutter/material.dart';
import 'package:recipes_app/theme/app_theme.dart';

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
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipOval(
                      child: Image.asset(
                        category['image'] ?? '',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  category['name'] ?? '',
                  style: TextStyle(
                    color: customPinkSwatch[300],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Sedan',
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
