import 'package:flutter/material.dart';
import 'package:beercrew/widgets/category_card.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // es necesario xq o si no lanza un error al no mostrarse el icono de libro definido //mueve el alto de la caja
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryCard(
            icon: Icon(Icons.battery_full, size: 40,),
            name: "Lager",
          ),
          CategoryCard(
            icon: Icon(Icons.battery_full, size: 40,),
            name: "ALE",
          ),
          CategoryCard(
            icon: Icon(Icons.battery_full, size: 40,),
            name: "IPA",
          ),
          CategoryCard(
            icon: Icon(Icons.battery_full, size: 40,),
            name: "Stout",
          ),
        ],
      ),
    );
  }
}
