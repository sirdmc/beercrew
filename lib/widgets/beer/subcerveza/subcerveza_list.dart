import 'package:beercrew/models/beer.dart';
import 'package:beercrew/screens/cerveza/Detalle/detalle.dart';
import 'package:flutter/material.dart';

class ListaSubCerveza extends StatelessWidget {

  final Beer beer;
  final Function onTap;
  ListaSubCerveza({this.beer, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.brown,
              //backgroundImage: AssetImage('assets/coffecup.png'),
            ),
            title: Text(beer.name),
            subtitle: Text(beer.type),
            onTap: () => onTap,
          ),
          )
    );
  }
}
