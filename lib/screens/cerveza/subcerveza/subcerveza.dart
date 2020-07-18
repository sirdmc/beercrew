import 'package:beercrew/models/beer.dart';
import 'package:beercrew/models/brewery.dart';
import 'package:beercrew/services/database.dart';
import 'package:beercrew/widgets/beer/beer_list.dart';
import 'package:beercrew/widgets/beer/beercategoria_cart.dart';
import 'package:beercrew/widgets/beer/subcerveza/subcerveza_list.dart';
import 'package:flutter/material.dart';

class HomeSubCerveza extends StatefulWidget {

  final String type;
  final Brewery brewery;
  HomeSubCerveza({this.type, this.brewery});

  @override
  _HomeSubCervezaState createState() => _HomeSubCervezaState(type: this.type, brewery: this.brewery);
}

class _HomeSubCervezaState extends State<HomeSubCerveza> {
  final String type;
  final Brewery brewery;


  _HomeSubCervezaState({this.type,this.brewery});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.type),
      ),
      body: Container(
          height: height - 103, // es necesario xq o si no lanza un error al no mostrarse el icono de libro definido //mueve el alto de la caja
          child: FutureBuilder(
              future: DatabaseService().getFilterBeers(widget.type, widget.brewery),
              builder: (BuildContext context, AsyncSnapshot<List<Beer>> snapshot) {
                if(snapshot.hasData ) {
                  List<Beer> beerCategorias = snapshot.data;
                  List<Widget> listaBeerCategorias = new List<Widget>();
                  for(Beer beerCategoria in beerCategorias) {
                    listaBeerCategorias.add(
                        ListaSubCerveza(
                          beer: beerCategoria,
                          onTap: (){
                          print(beerCategoria.name);
                        },)
                    );
                  }
                  return Container(
                    child: Column(
                      children: listaBeerCategorias,
                    ),
                  );
                }
                return Container();
              }
          )
      ),
    );
  }
}
