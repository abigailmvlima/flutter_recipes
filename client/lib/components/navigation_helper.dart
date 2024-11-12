import 'package:flutter/material.dart';
import 'package:recipes_app/views/home_view.dart';
import 'package:recipes_app/views/favorites_view.dart';
import 'package:recipes_app/views/most_accessed_view';
// Importe outras views que você tiver, como AddView

void navigateToPage(BuildContext context, int index) {
  // Defina o nome da rota com base no índice
  String? routeName;
  switch (index) {
    case 0:
      routeName = '/home';
      break;
    case 1:
      routeName = '/favorites';
      break;
    case 2:
      routeName = '/add';
      break;
    case 3:
      routeName = '/most_accessed';
      break;
    default:
      routeName = '/home';
      break;
  }

  // Agora, verifique se o routeName foi definido antes de chamar o Navigator
  if (routeName != null) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _getPage(routeName!),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration:
            const Duration(milliseconds: 300), // Duração da animação
      ),
    );
  }
}

Widget _getPage(String routeName) {
  // Retorna a página correta com base no nome da rota
  switch (routeName) {
    case '/home':
      return const HomeView();
    case '/favorites':
      return const FavoritesView();
    case '/most_accessed':
      return const MostAccessedView();
    default:
      return const HomeView();
  }
}
