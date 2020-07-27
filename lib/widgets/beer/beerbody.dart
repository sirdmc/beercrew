import 'package:beercrew/models/beer.dart';
import 'package:beercrew/models/brewery.dart';
import 'package:beercrew/services/database.dart';
import 'package:beercrew/widgets/beer/beer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BeerBody extends StatelessWidget {

  final Brewery brewery;
  final String selectedCategory;
  final bool boton;
  final String buscar;
  BeerBody({this.brewery, this.selectedCategory, this.boton, this.buscar});

  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var bd;
    int alturaBody;

    if (buscar == null) {
      if (boton == false) {
        if (selectedCategory == null) {
          bd = DatabaseService().getBeers(brewery.id);
        } else {
          bd = DatabaseService().getFilterBeers(selectedCategory, brewery);
        }
      } else {
        if (selectedCategory == null) {
          bd = DatabaseService().getBeersOrder(brewery.id);
        } else {
          bd = DatabaseService().getFilterBeersOrderManual(
              selectedCategory, brewery);
        }
      }
    } else {
      if (selectedCategory == null) {
        bd = DatabaseService().getBuscarBeers(buscar, brewery);
      } else {
        bd = DatabaseService().getBuscarFilterBeers(selectedCategory , buscar, brewery);
      }
    }

    return SingleChildScrollView(
      child: Container(
        height: alturaBody == 0 ? 5000 : alturaBody, //height - 245
        child: FutureBuilder(
          future: bd, //selectedCategory == null ? DatabaseService().getBeers(brewery.id) : DatabaseService().getFilterBeers(selectedCategory, brewery),
          builder: (BuildContext context, AsyncSnapshot<List<Beer>> snapshot) {
            if(snapshot.hasData ) {
              List<Beer> beers = snapshot.data; //retorna cero elementos
              List<Widget> cervezas = new List<Widget>();
              alturaBody = (beers.length * 40) + 120;
              for(Beer beer in beers) {
                cervezas.add(
                    BeerList(beer: beer)
                );
              };
              return Container(
                  child: Column(
                    children: cervezas,
                  ),
                );
            }
            return SpinKitRotatingCircle(
              color: Colors.black,
              size: 50.0,
            );
          },
        ),
      ),
    );
  }

}






