import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/recipe.dart';
import '../services/api_service.dart';
import '../controllers/favorites_controller.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final FavoritesController favoritesController =
      Get.find<FavoritesController>(); // Use Get.find
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
          final recipe = recipes[index];

          return ListTile(
            title: Text(recipe.title),
            subtitle: Text(recipe.ingredients),
            leading: Image.network(recipe.image),
            trailing: Obx(() => IconButton(
                  icon: Icon(
                    favoritesController.isLiked(recipe.title)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  onPressed: () {
                    favoritesController.toggleFavorite(recipe.title);
                  },
                )),
            onTap: () {
              // TBD: Navigate to Recipe Detail
            },
          );
        },
      ),
    );
  }
}
