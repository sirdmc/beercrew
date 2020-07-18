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
    print('el valor del name en categoria card es ${categoria.name}');
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                unpressedImage: Image.network("https://www.w3schools.com/w3css/img_lights.jpg"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeSubCategoria(categoria: categoria,),
                  )
                ),
              ),
              /*IconButton(
                icon: icon,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeSubCategoria(name: name,),
                    )
                ),
              ),*/
              SizedBox(height: 10,),
              AutoSizeText(
                categoria.name,
                style: TextStyle(
                    fontSize: 15.0,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}