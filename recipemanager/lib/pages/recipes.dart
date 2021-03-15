import 'package:flutter/material.dart';
import 'package:recipemanager/components/recipe.dart';
import 'package:recipemanager/widgets/recipeCard.dart';

class Recipes extends StatelessWidget {
  List<Recipe> recipes = [
    Recipe(
      "Käseauflauf",
      "assets/images/kaeseauflauf.jpg",
      [
        "1 Lauch",
        "200g Kochschinken",
        "3 Eier",
        "200ml Milch",
        "300ml Schlagsahne",
        "1 Kugel Mozzarella",
        "1 Packung geriebener Käse",
        "200g kurze Makkaroni",
      ],
      """Lauch putzen, längs halbieren und gründlich waschen. Lauch in 1cm große Stücke schneiden.
Schinkenscheiben in 1cm große Würfel schneiden.
Eier mit Milch und Sahne verquirlen und mit Salz würzen.
Mozzarella entweder raspeln oder in Scheiben schneiden.

Nudeln in kochendem Wasser bissfest kochen. Lauch 3min vor Garzeit hinzugeben und mitkochen. Danach beides gut abgießen und abtropfen.

Nudeln, Lauch und Schinken mischen und in eine gefettete Auflaufform(28 x 18 cm) geben.
Eiersahne darübergießen und mit Käse und Mozarrella belegen.

Im heißen Ofen bei 200 Grad ~50 Minuten backen lassen. (Umluft nicht empfehlenswert).
      """,
    ),
    Recipe(
      "Muffin",
      "assets/images/usa.png",
      [
        "2 Mehl",
        "5 Eier",
      ],
      "Einfach muffin",
    )
  ];

  List<Recipe> getRecipes() {
    return this.recipes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(recipes[index]);
          },
        ),
      ),
    );
  }
}
