// lib/theme/app_theme.dart

import 'package:flutter/material.dart';

// Define o MaterialColor personalizado para a cor principal
const MaterialColor customPinkSwatch = MaterialColor(
  0xFFE171BA,
  <int, Color>{
    50: Color(0xFFFDF8FA), // Cor menu lateral
    100: Color(0xFFFFD0E6), // Cor circulo dos tipos de receita
    200: Color(0xFFE171BA), // Cor principal
    300: Color(0xFFA000A2), // cor icones selecionados e menu lateral
    400: Color(0xFFE958AF),
    500: Color(0xFFE171BB),
    600: Color(0xFFD363A5),
    700: Color(0xFFC0548F),
    800: Color(0xFFA54579),
    900: Color(0xFF8B3663),
  },
);

// Função que retorna o tema do app
ThemeData appTheme() {
  return ThemeData(
    primarySwatch: customPinkSwatch,
    primaryColor: const Color(0xFFE171BA), // Cor principal
    colorScheme:
        ColorScheme.fromSwatch(primarySwatch: customPinkSwatch).copyWith(
      secondary: const Color(0xFFFFD0E6),
    ),
    // Outras configurações de tema podem ser adicionadas aqui
  );
}
