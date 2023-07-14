import 'package:flutter/material.dart';
import 'package:menu/recipe.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.recipe,
  });

  final Recipe? recipe;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    int persons = widget.recipe!.servings;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe!.label),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 300.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.recipe!.imageUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(widget.recipe!.label, style: TextStyle(fontSize: 24.0),),
          ListView.builder(
              shrinkWrap: true,
              itemCount: widget.recipe!.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.recipe!.ingredients[index].quantity.toString(), style: TextStyle(fontSize: 16.0),),
                    SizedBox(
                      width: 15,
                    ),
                    Text(widget.recipe!.ingredients[index].measure, style: TextStyle(fontSize: 16.0)),
                    SizedBox(
                      width: 15,
                    ),
                    Text(widget.recipe!.ingredients[index].name, style: TextStyle(fontSize: 16.0))
                  ],
                );
              }),
          SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  overlayColor: Color(0X290384fc),
                  thumbColor: Color(0XFF0384fc),
                  activeTrackColor: Color(0XFF0384fc),
                  inactiveTrackColor: Color(0X290384fc)),
              child: Slider(
                  value: 1,
                  min: 1.0,
                  max: 20.0,
                  divisions: 20,
                  onChanged: (newValue) {
                    setState(() {
                      persons = newValue.round() * widget.recipe!.servings;
                    });
                  }))
        ],
      ),
    );
  }
}
