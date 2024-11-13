import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class IngredientRow extends StatelessWidget {
  final void Function()? onAdd;

  const IngredientRow({super.key, this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomTextField(hintText: 'Qtdade'),
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: CustomTextField(hintText: 'Medida'),
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: CustomTextField(hintText: 'Produto'),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.add, color: Colors.purple),
          onPressed: onAdd,
        ),
      ],
    );
  }
}