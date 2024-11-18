import 'package:flutter/material.dart';
import 'package:recipes_app/theme/app_theme.dart';

class Menu extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const Menu({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: customPinkSwatch[300],
      unselectedItemColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Adicionar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.whatshot),
          label: 'Em Alta',
        ),
      ],
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        fontFamily: 'Sedan',
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        fontFamily: 'Sedan',
      ),
    );
  }
}
