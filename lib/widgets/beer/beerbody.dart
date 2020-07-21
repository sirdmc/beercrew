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
  BeerBody({this.brewery, this.selectedCategory, this.boton});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var bd;

    print('el boton en $boton');
    print('la categoria es $selectedCategory');
    /*
    if (boton == false && selectedCategory == null) {
      print('1');
      var bd = DatabaseService().getBeers(brewery.id);
    } if (boton == false && selectedCategory != null) {
      print('2');
      var bd = DatabaseService().getFilterBeers(selectedCategory, brewery);
    } if (boton == true && selectedCategory == null) {
      print('3');
      var bd = DatabaseService().getBeersOrder(brewery.id);
    } if (boton == true && selectedCategory != null) {
      print('4');
      var bd = DatabaseService().getFilterBeersOrder(selectedCategory, brewery);
    }
    */
    if (boton == false) {
      if (selectedCategory == null) {
        print('1');
        bd = DatabaseService().getBeers(brewery.id);
      } else {
        bd = DatabaseService().getFilterBeers(selectedCategory, brewery);
      }
    } else {
      if (selectedCategory == null) {
        bd = DatabaseService().getBeersOrder(brewery.id);
      } else {
        bd = DatabaseService().getFilterBeersOrder(selectedCategory, brewery);
      }
    }

    print(bd);
    /*if (selectedCategory == null) {
      var bd = DatabaseService().getBeers(brewery.id);
    } else {
      var bd = DatabaseService().getFilterBeers(selectedCategory, brewery);
    }
    */

    return SingleChildScrollView(
      child: Container(
        height: height - 103,
        child: FutureBuilder(
          future: bd, //selectedCategory == null ? DatabaseService().getBeers(brewery.id) : DatabaseService().getFilterBeers(selectedCategory, brewery),
          builder: (BuildContext context, AsyncSnapshot<List<Beer>> snapshot) {
            if(snapshot.hasData ) {
              List<Beer> beers = snapshot.data; //retorna cero elementos
              List<Widget> cervezas = new List<Widget>();

              for(Beer beer in beers) {
                cervezas.add(
                    BeerList(beer: beer)
                );
              }
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






