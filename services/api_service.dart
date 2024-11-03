import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class ApiService {
  static Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));
    
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['recipes'];
      return jsonData.map((recipe) => Recipe.fromJson(recipe)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}

