import 'package:beercrew/models/beer.dart';
import 'package:beercrew/screens/cerveza/homebeer.dart';
import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/franc/AndroidStudioProjects/beercrew/lib/screens/cerveza/Detalle/detalle.dart';
import 'package:flutter/material.dart';
import 'package:beercrew/models/brewery.dart';
import 'package:intl/intl.dart';

class BeerList extends StatelessWidget {

  final Beer beer;
  final Brewery brewery;
  BeerList({this.beer, this.brewery});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
          top: BorderSide(
              color: Colors.grey,
              width: 1.0
            ),
          )
        ),
        child: Container(
          height: 120,
          color: Color.fromRGBO(60, 63, 65, 1),
          //elevation: 10,
          //shape: RoundedRectangleBorder(
            //borderRadius: BorderRadius.circular(15.0),
          //),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>  [
              fila_detalle_producto(beer: beer, brewery: brewery,),
          ])
        ),
      ),
    );
  }
}

class fila_detalle_producto extends StatelessWidget {
  fila_detalle_producto({
    @required this.beer, this.brewery
    
  });

  final Beer beer;
  final Brewery brewery;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeDetalle(beer: beer, brewery: brewery,),
      )),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: 20,),
                      CircleAvatar(
                          radius: 45.0,
                          backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/beercrew-ba22a.appspot.com/o/botella_cerveza.jpg?alt=media&token=7a173f90-eaba-476e-8496-ac3c447f6509')
                      ),
                      SizedBox(width: 20,)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(beer.name, style: TextStyle(color: Colors.white),),
                      Text('\$  ${NumberFormat('#,###').format(beer.price)}', style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(width: 70,),
                Text(beer.name, style: TextStyle(color: Colors.white),),
                SizedBox(width: 20,)
              ],
            )
          ],
        )
      ),
    );
  }
}

/*
Padding(
padding: EdgeInsets.only(top: 0.0),
child: Card(
color: Color.fromRGBO(60, 63, 65, 0.8),
//elevation: 10,
//shape: RoundedRectangleBorder(
//borderRadius: BorderRadius.circular(15.0),
//),
margin: EdgeInsets.fromLTRB(0, 0, 0, 0.0),
child: ListTile(
leading: CircleAvatar(
radius: 25.0,
backgroundColor: Colors.brown,
//backgroundImage: AssetImage('assets/coffecup.png'),
),
title: Text(beer.name),
subtitle: Text(beer.price.toString()),
onTap: () => Navigator.push(
context,
MaterialPageRoute(
builder: (context) => HomeDetalle(beer: beer),
)
),
)
),
);
*/


/*ListTile(
dense: false,
title:Text(beer.name, style: TextStyle(color: Colors.white),) ,
trailing: Text('\$  ${NumberFormat('#,###').format(beer.price)}', style: TextStyle(color: Colors.white),),
//contentPadding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
leading: /*Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/beercrew-ba22a.appspot.com/o/botella_cerveza.jpg?alt=media&token=7a173f90-eaba-476e-8496-ac3c447f6509'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),*/
CircleAvatar(
radius: 30.0,
//backgroundColor: Colors.blue,
backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/beercrew-ba22a.appspot.com/o/botella_cerveza.jpg?alt=media&token=7a173f90-eaba-476e-8496-ac3c447f6509')
//backgroundImage: AssetImage('assets/coffecup.png'),
),
subtitle: Text(beer.name, style: TextStyle(color: Colors.white),),
onTap: () => Navigator.push(
context,
MaterialPageRoute(
builder: (context) => HomeDetalle(beer: beer),
)
),
),*/