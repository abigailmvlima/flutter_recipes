import 'package:flutter/material.dart';
import 'package:recipes_app/components/boxTextField.dart';
import 'package:recipes_app/components/header.dart';
import 'package:recipes_app/components/menu.dart';
import 'package:recipes_app/theme/app_theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(title: 'Perfil'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildProfileImage(), // Ícone da foto alinhado ao centro
              const SizedBox(height: 24),
              const BoxTextField(
                label: 'Nome',
                hintText: 'Abigail Lima',
              ),
              const BoxTextField(
                label: 'Email',
                hintText: 'Abigail@email.com',
              ),
              const BoxTextField(
                label: 'Senha Atual',
                hintText: '*********',
                obscureText: true,
              ),
              const BoxTextField(
                label: 'Nova Senha',
                hintText: '*********',
                obscureText: true,
              ),
              const BoxTextField(
                label: 'Confirmar Senha',
                hintText: '*********',
                obscureText: true,
              ),
              const SizedBox(height: 24),
              _buildSaveButton(), // Botão alinhado à direita
            ],
          ),
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
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: customPinkSwatch[300],
            child: const Icon(Icons.account_circle,
                color: Colors.white, size: 100),
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
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(Icons.add, color: customPinkSwatch[300], size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Botão para salvar
  Widget _buildSaveButton() {
    return Align(
      alignment: Alignment.centerRight, // Alinha o botão à direita
      child: ElevatedButton(
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
            fontFamily: 'Sedan',
          ),
        ),
      ),
    );
  }
}
