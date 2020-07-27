import 'package:beercrew/constants.dart';
import 'package:beercrew/screens/cerveza/Detalle/detalle.dart';
import 'package:beercrew/screens/menu/contacto.dart';
import 'package:beercrew/widgets/home/menu.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/franc/AndroidStudioProjects/beercrew/lib/widgets/home/homebody.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BEER CREW'),
      ),
      drawer: Menu(),
      body: HomeBody(),
    );
  }
}
