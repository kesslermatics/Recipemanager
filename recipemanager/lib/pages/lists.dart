import 'package:flutter/material.dart';
import 'package:recipemanager/pages/addList.dart';
import "package:shared_preferences/shared_preferences.dart";
import "dart:convert";

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  List<dynamic> shoppingList = [];
  List<dynamic> emptyList = [];

  void addToList() async {
    dynamic shoppingList = await Navigator.pushNamed(
      context,
      "/addList",
    );
    this.shoppingList = shoppingList["shoppingList"];
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      final key = "list";
      final value = jsonEncode(this.shoppingList);
      prefs.setString(key, value);
      print("Saved");
    });
  }

  void readList() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      final key = "list";
      final value = prefs.getString(key);
      if (value != null) {
        this.shoppingList = jsonDecode(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    readList();
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  addToList();
                });
              },
              child: Text("Hinzufügen"),
            ),
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: shoppingList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          shoppingList[index],
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    dynamic shoppingList = await Navigator.pushNamed(
                      context,
                      "/addList",
                      arguments: {"shoppingList": this.shoppingList},
                    );
                    this.shoppingList = shoppingList["shoppingList"];
                    final prefs = await SharedPreferences.getInstance();
                    setState(() {
                      final key = "list";
                      final value = jsonEncode(this.shoppingList);
                      prefs.setString(key, value);
                      print("Saved");
                    });
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    setState(() {
                      this.shoppingList.clear();
                      prefs.setString("list", jsonEncode(this.shoppingList));
                    });
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
      color: Colors.greenAccent,
    );
  }
}
