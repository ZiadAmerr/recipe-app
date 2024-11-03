import 'package:flutter/material.dart';
import 'recipe_list_screen.dart';
import 'ingredient_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to Recipe Book')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/welcome_image.png'), // Add an image in your assets
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('View Recipes'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecipeListScreen()),
                );
              },
            ),
            ElevatedButton(
              child: Text('View Ingredients'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IngredientListScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

