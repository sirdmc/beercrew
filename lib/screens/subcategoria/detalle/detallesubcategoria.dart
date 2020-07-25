import 'package:beercrew/models/subcategoria.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDetalleSubC extends StatelessWidget {

  final SubCategoria subCategoria;
  HomeDetalleSubC({this.subCategoria});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subCategoria.name),
      ),
      body: subCategoria.url != '0' ? Center(
        child: RaisedButton(
          onPressed: launchURL,
          child: Text('Detalle SubCategoria'),
        ),
      ) : Container(),
    );
  }

  launchURL() async {
    //const url = 'https://flutter.dev';
    String url = subCategoria.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
