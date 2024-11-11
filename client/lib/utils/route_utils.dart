import 'package:flutter/material.dart';
import 'dart:ui';

Route createBlurRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final blurAnimation =
          Tween<double>(begin: 5.0, end: 0.0).animate(animation);
      final fadeAnimation =
          Tween<double>(begin: 0.0, end: 1.0).animate(animation);

      return FadeTransition(
        opacity: fadeAnimation,
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: blurAnimation.value, sigmaY: blurAnimation.value),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}
