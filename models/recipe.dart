class Recipe {
  final String title;
  final String description;
  final String image;

  Recipe({required this.title, required this.description, required this.image});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}

