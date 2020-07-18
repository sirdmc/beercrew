import 'package:beercrew/models/categoria.dart';
import 'package:beercrew/services/database.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/franc/AndroidStudioProjects/beercrew/lib/widgets/categoria/category_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CategoryContainer extends StatelessWidget {

  final Categoria categoria;
  CategoryContainer({this.categoria});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: 120, // es necesario xq o si no lanza un error al no mostrarse el icono de libro definido //mueve el alto de la caja
      child: FutureBuilder(
          future: DatabaseService().getCategoria(),
          builder: (BuildContext context, AsyncSnapshot<List<Categoria>> snapshot) {
            if(snapshot.hasData ) {
              List<Categoria> categorias = snapshot.data;
              List<Widget> listaCategorias = new List<Widget>();
              for(Categoria categoria in categorias) {
                listaCategorias.add(
                    CategoryCard(categoria: categoria,)
                );
              }
              return ListView(
                scrollDirection: Axis.horizontal,
                  children: listaCategorias,
              );
            }
            return SpinKitRotatingCircle(
                color: Colors.black,
                size: 50.0,);
          }
      )
    );
  }
}
