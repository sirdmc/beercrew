import 'package:beercrew/models/beer.dart';
import 'package:beercrew/screens/cerveza/homebeer.dart';
import 'package:flutter/material.dart';
import 'package:beercrew/models/brewery.dart';

class BreweryList extends StatelessWidget {

  final Brewery brewery;
  BreweryList({this.brewery});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      /*child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(brewery.logo),
          ),
          title: Text(brewery.id),
          subtitle: Text(brewery.price),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeBeer(brewery: brewery),
            )
          ),
        ),
      ),*/
      child: GestureDetector(
          child: Container(
              width:120,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.black
                  )
                ],
                color: Colors.black,
                image: DecorationImage(
                    image: NetworkImage(brewery.logo),
                    fit:BoxFit.cover
                ), // button text
              )
          ),
          onTap:() => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeBeer(brewery: brewery),
              )
          ),
      ),
    );
  }
}
