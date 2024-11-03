import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(RecipeBookApp());
}

class RecipeBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

