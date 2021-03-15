import 'package:flutter/material.dart';
import 'package:recipemanager/components/recipe.dart';

class RecipePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Image.asset(
                recipe.imageURL,
                width: 400,
                height: 400,
              ),
              Text(
                recipe.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                  fontFamily: "Lobster",
                ),
              ),
              Divider(
                color: Colors.black,
                height: 50,
                thickness: 3,
              ),
              Text(
                "Zutaten:",
                style: TextStyle(fontSize: 36, fontFamily: "Lobster"),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: recipe.ingredients.length,
                  itemBuilder: (context, index) {
                    return Text(
                      recipe.ingredients[index],
                      style: TextStyle(fontSize: 22, fontFamily: "Lobster"),
                    );
                  },
                ),
              ),
              Divider(
                color: Colors.black,
                height: 80,
                thickness: 3,
              ),
              Text(
                "Zubereitung:",
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Lobster",
                ),
              ),
              Text(
                recipe.preparation,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Lobster",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
