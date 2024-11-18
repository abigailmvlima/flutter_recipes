import 'package:flutter/material.dart';
import 'package:recipes_app/theme/app_theme.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: customPinkSwatch[50],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.account_circle,
                        color: customPinkSwatch[300], size: 60),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Abigail Lima',
                      style: TextStyle(
                        color: customPinkSwatch[300],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sedan',
                        shadows: const [
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
                    icon: Icon(Icons.close, color: customPinkSwatch[300]),
                    onPressed: () {
                      Navigator.of(context).pop(); // Fecha o drawer
                    },
                  ),
                ],
              ),
            ),
            Divider(color: customPinkSwatch[300]),
            ListTile(
              leading: Icon(Icons.add_box, color: customPinkSwatch[300]),
              title: Text(
                'Adicionar Receita',
                style: TextStyle(
                    color: customPinkSwatch[300], fontFamily: 'Sedan'),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/add');
              },
            ),
            ListTile(
              leading: Icon(Icons.straighten, color: customPinkSwatch[300]),
              title: Text(
                'Conversor de Medidas',
                style: TextStyle(
                    color: customPinkSwatch[300], fontFamily: 'Sedan'),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context,
                    '/measure_converter'); // Navega para a página do conversor
              },
            ),
            // Adicionando novas opções ao Drawer
            ListTile(
              leading: Icon(Icons.account_circle, color: customPinkSwatch[300]),
              title: Text(
                'Perfil',
                style: TextStyle(
                    color: customPinkSwatch[300], fontFamily: 'Sedan'),
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
