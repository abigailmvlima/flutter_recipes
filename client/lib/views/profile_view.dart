import 'package:flutter/material.dart';
import 'package:recipes_app/components/header.dart';
import 'package:recipes_app/components/menu.dart';
import 'package:recipes_app/components/section_title.dart';
import 'package:recipes_app/components/custom_text_field.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(title: 'Perfil'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            _buildProfileImage(),
            const SizedBox(height: 24),
            const SectionTitle(title: 'Nome'),
            const SizedBox(height: 8),
            const CustomTextField(hintText: 'Abigail Lima'),
            const SizedBox(height: 16),
            const SectionTitle(title: 'Email'),
            const SizedBox(height: 8),
            const CustomTextField(hintText: 'Abigail@email.com'),
            const SizedBox(height: 16),
            const SectionTitle(title: 'Senha'),
            const SizedBox(height: 8),
            const CustomTextField(hintText: '*********', obscureText: true),
            const SizedBox(height: 16),
            const SectionTitle(title: 'Confirmar Senha'),
            const SizedBox(height: 8),
            const CustomTextField(hintText: '*********', obscureText: true),
            const SizedBox(height: 24),
            _buildSaveButton(),
          ],
        ),
      ),
      bottomNavigationBar: Menu(
        currentIndex: 0,
        onTap: (index) {
          // Implementar navegação do Menu aqui
        },
      ),
    );
  }

  // Componente para a imagem de perfil
  Widget _buildProfileImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.purple,
          child: Icon(Icons.account_circle, color: Colors.white, size: 80),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.purple, width: 2),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(Icons.add, color: Colors.purple, size: 18),
            ),
          ),
        ),
      ],
    );
  }

  // Botão para salvar
  Widget _buildSaveButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      ),
      onPressed: () {
        // Implementar ação de salvar perfil
      },
      child: const Text(
        'Salvar',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
