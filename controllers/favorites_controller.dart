import 'package:get/get.dart';

class FavoritesController extends GetxController {
  var likedIngredientTitles = <String>[].obs;

  // Toggle favorite status
  void toggleFavorite(String ingredientTitle) {
    if (likedIngredientTitles.contains(ingredientTitle)) {
      likedIngredientTitles.remove(ingredientTitle);
    } else {
      likedIngredientTitles.add(ingredientTitle);
    }
  }

  // Check if an ingredient is liked
  bool isLiked(String ingredientTitle) {
    return likedIngredientTitles.contains(ingredientTitle);
  }
}
