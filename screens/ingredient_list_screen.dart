import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorites_controller.dart';
import '../models/recipe.dart';
import '../services/api_service.dart';

class IngredientListScreen extends StatefulWidget {
  @override
  _IngredientListScreenState createState() => _IngredientListScreenState();
}

class _IngredientListScreenState extends State<IngredientListScreen> {
  final FavoritesController favoritesController =
      Get.find<FavoritesController>();
  List<Recipe> likedRecipes = []; // Store recipes with liked ingredients

  @override
  void initState() {
    super.initState();
    fetchLikedIngredients();
  }

  Future<void> fetchLikedIngredients() async {
    // Fetch all recipes from the API
    final allRecipes = await ApiService.fetchRecipes();
    // Filter recipes based on the liked ingredient titles in the FavoritesController
    final filteredRecipes = allRecipes
        .where((recipe) => favoritesController.isLiked(recipe.title))
        .toList();

    setState(() {
      likedRecipes = filteredRecipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite Ingredients')),
      body: likedRecipes.isEmpty
          ? Center(child: Text('No ingredients favored yet'))
          : ListView.builder(
              itemCount: likedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = likedRecipes[index];
                return ListTile(
                  title: Text(recipe.title),
                  subtitle: Text(recipe.ingredients),
                  leading: Image.network(recipe.image),
                  onTap: () {
                    // Optionally navigate to recipe detail if needed
                  },
                );
              },
            ),
    );
  }
}
