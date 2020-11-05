import 'package:flutter/material.dart';

class AppAnimations {
  static void openPage(BuildContext context, Widget page) {
    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_, __, ___) {
      return page;
    }, transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(opacity: animation, child: child);
    }));
  }
}
