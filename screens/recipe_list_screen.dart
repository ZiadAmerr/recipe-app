import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/api_service.dart';

List<String> likedIngredientTitles = [];

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> recipes = [];
  
  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    final fetchedRecipes = await ApiService.fetchRecipes();
    setState(() {
      recipes = fetchedRecipes;
    });
  }

  void toggleFavorite(String ingredientId) {
    setState(() {
      if (likedIngredientTitles.contains(ingredientId)) {
        likedIngredientTitles.remove(ingredientId);
      } else {
        likedIngredientTitles.add(ingredientId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe List')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          final isLiked = likedIngredientTitles.contains(recipe.title);

          return ListTile(
            title: Text(recipe.title),
            subtitle: Text(recipe.ingredients),
            leading: Image.network(recipe.image),
            trailing: IconButton(
              icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                toggleFavorite(recipe.title);
              },
            ),
            onTap: () {
              // TBD
            },
          );
        },
      ),
    );
  }
}
