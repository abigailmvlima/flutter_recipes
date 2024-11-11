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
              decoration: BoxDecoration(
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
                  Expanded(
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
                // Implementar a navegação ou ação para "Adicionar Receita"
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
                // Implementar a navegação ou ação para "Conversor de Medidas"
              },
            ),
          ],
        ),
      ),
    );
  }
}
