import 'package:beercrew/models/beer.dart';
import 'package:beercrew/models/brewery.dart';
import 'package:beercrew/services/database.dart';
import 'package:beercrew/widgets/beer/beercategoria_cart.dart';
import 'package:beercrew/widgets/categoria/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:beercrew/models/beercategoria.dart';

class ShowBeerCategoria extends StatelessWidget {

  final Brewery brewery;
  ShowBeerCategoria({this.brewery});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120, // es necesario xq o si no lanza un error al no mostrarse el icono de libro definido //mueve el alto de la caja
        child: FutureBuilder(
            future: DatabaseService().getBeerCategoria(),
            builder: (BuildContext context, AsyncSnapshot<List<BeerCategoria>> snapshot) {
              if(snapshot.hasData ) {
                List<BeerCategoria> beerCategorias = snapshot.data;
                List<Widget> listaBeerCategorias = new List<Widget>();
                for(BeerCategoria beerCategoria in beerCategorias) {
                  listaBeerCategorias.add(
                      BeerCategoryCard(name: beerCategoria.name,)
                  );
                }
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: listaBeerCategorias,
                );
              }
              return Container();
            }
        )
    );
  }
}
