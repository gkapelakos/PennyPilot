import 'package:flutter/material.dart';

class IconHelper {
  static final Map<String, IconData> iconMap = {
    'home': Icons.home,
    'work': Icons.work,
    'school': Icons.school,
    'shopping_cart': Icons.shopping_cart,
    'fastfood': Icons.fastfood,
    'movie': Icons.movie,
    'fitness_center': Icons.fitness_center,
    'local_hospital': Icons.local_hospital,
    'pets': Icons.pets,
    'flight': Icons.flight,
    'hotel': Icons.hotel,
    'directions_car': Icons.directions_car,
    // Add more icons here
  };

  static IconData? getIconData(String iconName) {
    return iconMap[iconName];
  }
}
