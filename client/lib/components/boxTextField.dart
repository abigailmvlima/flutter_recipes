import 'package:flutter/material.dart';
import 'package:recipes_app/components/section_title.dart';
import 'package:recipes_app/components/custom_text_field.dart';

class BoxTextField extends StatelessWidget {
  final String label; // O título ou nome do campo
  final String hintText; // O texto de dica no campo
  final bool obscureText; // Caso o campo seja uma senha
  final double marginTop; // Margem superior
  final double marginBottom; // Margem inferior

  const BoxTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false, // Valor padrão como falso
    this.marginTop = 5.0, // Valor padrão para a margem superior
    this.marginBottom = 5.0, // Valor padrão para a margem inferior
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: label), // Título do campo
          CustomTextField(
            hintText: hintText,
            obscureText: obscureText,
          ), // Campo de texto personalizado
        ],
      ),
    );
  }
}
