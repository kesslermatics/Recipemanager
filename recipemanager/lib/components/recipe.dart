import 'package:flutter/material.dart';

class Recipe {
  String title;
  String imageURL;
  List<String> ingredients;
  String preparation;

  Recipe(this.title, this.imageURL, this.ingredients, this.preparation);
}
