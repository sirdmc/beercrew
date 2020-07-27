import 'package:beercrew/models/subcategoria.dart';
import 'package:beercrew/screens/subcategoria/detalle/detallesubcategoria.dart';
import 'package:flutter/material.dart';

class ListaSubCategoria extends StatelessWidget {

  final SubCategoria subCategoria;
  ListaSubCategoria({this.subCategoria});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.blue,
              //backgroundImage: AssetImage('assets/coffecup.png'),
            ),
            title: Text(subCategoria.name),
            subtitle: Text(subCategoria.type),
           onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetalleSubC(subCategoria: subCategoria,),
                )
            ),
          )
      ),
    );
  }
}
