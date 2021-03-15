import 'package:flutter/material.dart';
import 'package:recipemanager/pages/home.dart';
import 'package:recipemanager/pages/recipepreview.dart';
import 'package:recipemanager/pages/addList.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
        "/recipePreview": (context) => RecipePreview(),
        "/addList": (context) => AddShoppingList(),
      },
    ),
  );
}
