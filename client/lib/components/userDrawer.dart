import 'package:flutter/material.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.pink.shade50,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.pinkAccent,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.account_circle,
                        color: Colors.purple, size: 50),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Abigail Lima',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop(); // Fecha o drawer
                    },
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.purple),
            ListTile(
              leading: const Icon(Icons.add_box, color: Colors.purple),
              title: const Text(
                'Adicionar Receita',
                style: TextStyle(color: Colors.purple),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/add');
              },
            ),
            ListTile(
              leading: const Icon(Icons.straighten, color: Colors.purple),
              title: const Text(
                'Conversor de Medidas',
                style: TextStyle(color: Colors.purple),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context,
                    '/measure_converter'); // Navega para a página do conversor
              },
            ),
            // Adicionando novas opções ao Drawer
            ListTile(
              leading: const Icon(Icons.account_circle, color: Colors.purple),
              title: const Text(
                'Perfil',
                style: TextStyle(color: Colors.purple),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(
                    context, '/profile'); // Navega para a página do perfil
              },
            ),
          ],
        ),
      ),
    );
  }
}
