import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions; // Adiciona o parâmetro 'actions' como opcional

  const Header({
    super.key,
    this.title = 'Aroma Caseiro',
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.white, // Define a cor do ícone de menu
      ),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.normal,
          fontFamily: 'Sedan',
        ),
      ),
      actions: actions, // Define 'actions' no AppBar para ser configurável
    );
  }
}
