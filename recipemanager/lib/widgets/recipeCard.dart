import 'package:flutter/material.dart';
import 'package:recipemanager/components/recipe.dart';

class RecipeCard extends StatelessWidget {
  Recipe recipe;

  RecipeCard(this.recipe);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/recipePreview", arguments: recipe);
      },
      child: Flexible(
        child: Card(
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Image.asset(
                      recipe.imageURL,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    recipe.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 40, fontFamily: "Lobster"),
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
