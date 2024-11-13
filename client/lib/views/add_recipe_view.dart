import 'package:flutter/material.dart';
import 'package:recipes_app/components/header.dart';
import 'package:recipes_app/components/menu.dart';
import 'package:recipes_app/components/navigation_helper.dart';
import 'package:recipes_app/components/section_title.dart';
import 'package:recipes_app/components/custom_text_field.dart';
import 'package:recipes_app/components/image_picker_field.dart';
import 'package:recipes_app/components/ingredient_row.dart';

class AddRecipeView extends StatefulWidget {
  const AddRecipeView({super.key});

  @override
  AddRecipeViewState createState() => AddRecipeViewState();
}

class AddRecipeViewState extends State<AddRecipeView> {
  int _selectedIndex = 2; // Indica que "Adicionar" está selecionado no Menu

  // ignore: unused_element
  void _onMenuTap(int index) {
    if (index == _selectedIndex) return; // Evita recarregar a mesma página

    setState(() {
      _selectedIndex = index;
    });
    navigateToPage(context, index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(title: 'Adicionar Receita'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const CustomTextField(hintText: 'Nome da Receita'),
            const SizedBox(height: 16),
            const SizedBox(height: 8),
            const ImagePickerField(),
            const SizedBox(height: 16),
            const SectionTitle(title: 'Ingredientes'),
            const SizedBox(height: 8),
            IngredientRow(
              onAdd: () {
                // Implementar ação de adicionar ingrediente
              },
            ),
            const SizedBox(height: 16),
            const SectionTitle(title: 'Modo de Preparo'),
            const SizedBox(height: 8),
            const CustomTextField(hintText: 'Modo de Preparo', maxLines: 5),
            const SizedBox(height: 16),
            const SectionTitle(title: 'Observação'),
            const SizedBox(height: 8),
            const CustomTextField(hintText: 'Observação', maxLines: 2),
            const SizedBox(height: 16),
            _buildSaveButton(context),
          ],
        ),
      ),
      bottomNavigationBar: Menu(
        currentIndex: _selectedIndex,
        onTap: _onMenuTap,
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        ),
        onPressed: () {
          // Implementar ação de salvar receita
        },
        child: const Text(
          'Salvar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
