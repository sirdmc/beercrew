import 'package:beercrew/models/brewery.dart';
import 'package:beercrew/screens/cerveza/subcerveza/subcerveza.dart';
import 'package:beercrew/screens/subcategoria/subcategoria.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:imagebutton/imagebutton.dart';

class BeerCategoryCard extends StatelessWidget {

  final String name;
  final Function onTap;
  final String url;

  BeerCategoryCard({this.name, this.onTap, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      /*child: InkWell(
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
                      url
                  ),
                  unpressedImage: Image.network(url)
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
      ),*/
      child: GestureDetector(
          child: Container(
              width:120,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.blueGrey
                  )
                ],
                color: Colors.black,
                image: DecorationImage(
                    image: NetworkImage(url),
                    fit:BoxFit.cover
                ), // button text
              )
          ),
          onTap:onTap
      ),

      );
  }
}