import 'package:flutter/material.dart';
import 'custom/app_colors.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podcast',
      theme: ThemeData(
        primarySwatch: AppColors.primary,
      ),
      home: HomePage(title: 'Flutter hello'),
    );
  }
}