import 'package:beercrew/models/brewery.dart';
import 'package:beercrew/screens/cerveza/subcerveza/subcerveza.dart';
import 'package:beercrew/screens/subcategoria/subcategoria.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:imagebutton/imagebutton.dart';

class BeerCategoryCard extends StatelessWidget {

  final String name;
  final Function onTap;

  BeerCategoryCard({this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(  //sombra de la caja
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    color: Colors.blueGrey
                )
              ]
          ),
          width: 100,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                ImageButton(
                  children: <Widget>[],
                  width: 50,
                  height: 50,
                  paddingTop: 5,
                  pressedImage: Image.network(
                      "https://www.w3schools.com/w3css/img_lights.jpg"
                  ),
                  unpressedImage: Image.network("https://www.w3schools.com/w3css/img_lights.jpg")
                ),
                SizedBox(height: 10,),
                AutoSizeText(
                  name,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}