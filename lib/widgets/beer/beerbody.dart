import 'package:beercrew/models/beer.dart';
import 'package:beercrew/models/brewery.dart';
import 'package:beercrew/services/database.dart';
import 'package:beercrew/widgets/beer/beer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BeerBody extends StatelessWidget {

  final Brewery brewery;
  final String selectedCategory;
  BeerBody({this.brewery, this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        height: height - 103,
        child: FutureBuilder(
          future: selectedCategory == null ? DatabaseService().getBeers(brewery.id) : DatabaseService().getFilterBeers(selectedCategory, brewery),
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





