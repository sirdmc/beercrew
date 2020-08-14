import 'package:beercrew/models/subcategoria.dart';
import 'package:beercrew/screens/subcategoria/detalle/detallesubcategoria.dart';
import 'package:flutter/material.dart';

class ListaSubCategoria extends StatelessWidget {

  final SubCategoria subCategoria;
  ListaSubCategoria({this.subCategoria});

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
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeDetalleSubC(subCategoria: subCategoria,),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(subCategoria.name, style: TextStyle(color: Colors.white)),
                                      Text(subCategoria.type, style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  )
                ])
        ),
      ),
    );
  }
}
/*
Padding(
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
height: 90,
color: Color.fromRGBO(60, 63, 65, 1),
margin: EdgeInsets.fromLTRB(0, 0, 0, 0.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>  [ ListTile(
leading: CircleAvatar(
radius: 25.0,
backgroundColor: Colors.blue,
//backgroundImage: AssetImage('assets/coffecup.png'),
),
title: Text(subCategoria.name, style: TextStyle(color: Colors.white),),
subtitle: Text(subCategoria.type, style: TextStyle(color: Colors.white)),
onTap: () => Navigator.push(
context,
MaterialPageRoute(
builder: (context) => HomeDetalleSubC(subCategoria: subCategoria,),
)
),
),
])
),
),
);
*/
