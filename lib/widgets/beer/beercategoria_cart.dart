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
      padding: const EdgeInsets.fromLTRB(20,20,0,20),
      child: GestureDetector(
          child: Container(
              width:100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                /*boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.blueGrey
                  )
                ],*/
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