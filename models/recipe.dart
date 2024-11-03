class Recipe {
  final String title;
  final String ingredients;
  final String image;

  Recipe({required this.title, required this.ingredients, required this.image});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    String title = json["name"];
    String ingredients = json["ingredients"].join(", ");
    String image = json["image"];
    return Recipe(
      title: title,
      ingredients: ingredients,
      image: image,
    );
  }
}

