import 'package:flutter/material.dart';
import 'package:menu/recipe.dart';

import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: Recipe.samples.length,
      itemBuilder: (BuildContext context, int index) {
      Recipe recipe = Recipe.samples[index];
        return  GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(recipe: recipe,)));
          },
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(image: AssetImage(recipe.imageUrl)),
                const SizedBox(height: 10),
                Text(recipe.label, style: TextStyle(fontSize: 24.0),),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      }
    );;
  }
}
