import 'package:flutter/material.dart';
import 'package:recipemanager/pages/lists.dart';
import 'package:recipemanager/pages/recipes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  Widget bodyWidget = ShoppingList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipemanager"),
        centerTitle: true,
      ),
      body: Container(
        child: bodyWidget,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(
            () {
              this.currentIndex = index;
              switch (index) {
                case 0:
                  bodyWidget = ShoppingList();
                  break;
                case 1:
                  bodyWidget = Recipes();
                  break;
                default:
              }
            },
          );
        },
        currentIndex: this.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: "Listen",
            backgroundColor: Colors.greenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt,
            ),
            label: "Rezepte",
          ),
        ],
      ),
    );
  }
}
