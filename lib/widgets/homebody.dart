import 'package:flutter/material.dart';
import '../services/db.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 10,),
        Center(child: Text('Categoría',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)),
        SizedBox(height: 10,),
        //Category(),
        Center(child: Text('Productos', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)),
        Container(
          height: 400, //es necesario si no hay un error
          child: RaisedButton(
            child: Text('traer!!!'),
            color: Colors.brown,
            onPressed: () => BringInfo().onPressed3(),
          ),
          //child: AllProducts()
        ),
      ],
    );
  }
}
