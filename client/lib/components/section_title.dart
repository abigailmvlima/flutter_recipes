import 'package:flutter/material.dart';
import 'package:recipes_app/theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: customPinkSwatch[300],
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Sedan',
      ),
    );
  }
}
