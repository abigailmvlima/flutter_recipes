import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final int maxLines;
  final Color textColor; // Cor do texto inserido
  final Color hintColor; // Cor do hintText

  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.maxLines = 1,
    this.textColor = Colors.black, // Valor padrão para a cor do texto
    this.hintColor = Colors.grey, // Valor padrão para a cor do hintText
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      maxLines: maxLines,
      style: TextStyle(color: textColor), // Define a cor do texto
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor), // Define a cor do hintText
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}