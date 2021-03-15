import 'package:flutter/material.dart';
import 'package:recipemanager/components/recipe.dart';
import 'package:recipemanager/pages/recipes.dart';

class AddShoppingList extends StatefulWidget {
  @override
  _AddShoppingListState createState() => _AddShoppingListState();
}

class _AddShoppingListState extends State<AddShoppingList> {
  List<dynamic> shoppingList = [];
  final textHolder = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    if (args != null) {
      this.shoppingList = args["shoppingList"];
    }
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, {"shoppingList": this.shoppingList});
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Liste hinzufügen"),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.greenAccent,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: RaisedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          List<Recipe> recipes = Recipes().getRecipes();
                          return AlertDialog(
                            content: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              height: MediaQuery.of(context).size.height / 2,
                              child: ListView.builder(
                                  itemCount: recipes.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.pop(context);
                                          shoppingList.addAll(
                                              recipes[index].ingredients);
                                        });
                                      },
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            recipes[index].title,
                                            style: TextStyle(fontSize: 24),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          );
                        },
                      );
                    },
                    child: Text("Rezept importieren"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: [
                      Text(
                        "Neu:  ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: textHolder,
                          style: TextStyle(fontSize: 20),
                          onFieldSubmitted: (text) {
                            setState(() {
                              textHolder.clear();
                              shoppingList.add(text);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: ListView.builder(
                          itemCount: shoppingList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        shoppingList[index],
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            shoppingList.removeAt(index);
                                          });
                                        },
                                        icon: Icon(Icons.delete),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
