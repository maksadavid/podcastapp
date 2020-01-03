import 'package:flutter/material.dart';
import 'package:tutu/ui/splash_page.dart';
import 'ui/utils/app_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podcast',
      theme: ThemeData(
        primarySwatch: AppColors.primary,
      ),
      home: SplashPage(title: 'Flutter hello'),
    );
  }
}