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
      /*child: Container(
        /*decoration: BoxDecoration(  //sombra de la caja
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  color: Colors.blueGrey
              )
            ]
        ),*/
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              ImageButton(
                children: <Widget>[],
                width: 100,
                height:100,
                paddingTop: 5,
                pressedImage: Image.network(
                  //"https://firebasestorage.googleapis.com/v0/b/beercrew-ba22a.appspot.com/o/restorants.jpg?alt=media&token=fcdc074b-05c1-4b76-b3f9-d45b120388e7"
                    categoria.url,
                ),
                unpressedImage: Image.network(categoria.url),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeSubCategoria(categoria: categoria,),
                  )
                ),
              ),
              /*SizedBox(height: 10,),
              AutoSizeText(
                categoria.name,
                style: TextStyle(
                    fontSize: 15.0,
                ),
                maxLines: 1,
              ),*/
            ],
          ),
        ),
      ),
    */
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