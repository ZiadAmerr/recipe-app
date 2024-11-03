import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/api_service.dart';

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe List')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].title),
            subtitle: Text(recipes[index].ingredients),
            leading: Image.network(recipes[index].image),
            trailing: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                // Logic to add to favorites
              },
            ),
            onTap: () {
              // Navigate to Recipe Detail
            },
          );
        },
      ),
    );
  }
}

