import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/favorites_controller.dart';
import 'screens/home_screen.dart';

void main() {
  // Ensure only one instance of FavoritesController is created
  Get.put(FavoritesController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
