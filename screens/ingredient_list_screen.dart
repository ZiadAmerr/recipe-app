import 'package:flutter/material.dart';

class IngredientListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ingredients')),
      body: Center(
        child: Text('List of Ingredients for Favourited Recipes'),
      ),
    );
  }
}

