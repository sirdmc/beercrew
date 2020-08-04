import 'package:beercrew/models/categoria.dart';
import 'package:beercrew/screens/subcategoria/subcategoria.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:imagebutton/imagebutton.dart';

class CategoryCard extends StatelessWidget {

  final Categoria categoria;

  CategoryCard({this.categoria});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                      image: NetworkImage(categoria.url),
                      fit:BoxFit.cover
                  ), // button text
              )
          ),
          onTap:() => Navigator.push(
            context,
              MaterialPageRoute(
                builder: (context) => HomeSubCategoria(categoria: categoria,),
              )
          )
      ),
      );
  }
}