import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';
import 'dart:io';

class ApiService {
  static Future<List<Recipe>> fetchRecipes() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['recipes'];
        for (var recipe in jsonData) {
          // print(recipe["name"]);
        }
        try {
          List<Recipe> recipes = [];
          Recipe recipe;
          for (var recipe in jsonData) {
            // print(recipe);
            recipe = Recipe.fromJson(recipe);
            recipes.add(recipe);
          }
          return recipes;
        } catch (e) {
          print(e);
          return [];
        }
      } else {
        throw Exception('Failed to load recipes');
      }
    } on SocketException {
      throw Exception('No internet connection');
    } catch (e) {
      throw Exception('Failed to load recipes');
    }
  }
}

