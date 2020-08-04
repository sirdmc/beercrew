import 'package:beercrew/screens/menu/contacto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Drawer kDrawer = Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: Text(
          'BEER CREW',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.message),
        title: Text('Contactanos'),
        onTap: () => {

        },
      ),
      ListTile(
        leading: Icon(Icons.account_circle),
        title: Text('Quienes Somos'),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Configuración'),
      ),
    ],
  ),
);


Container kSpinner = Container(
  child: SpinKitRotatingCircle(
    color: Colors.black,
    size: 50.0,
  ),
);