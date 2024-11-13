import 'package:flutter/material.dart';

class ImagePickerField extends StatelessWidget {
  final void Function()? onTap;

  const ImagePickerField({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.purple, size: 30),
              SizedBox(height: 8),
              Text(
                'Inserir Imagem',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
