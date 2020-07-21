import 'package:beercrew/models/beer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class HomeDetalle extends StatelessWidget {

  final Beer beer;
  HomeDetalle({this.beer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(beer.name),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: launchURL,
          child: Text('Detalle Cerveza'),
        ),
      ),
    );
  }

  launchURL() async {
    //const url = 'https://flutter.dev';
    String url = beer.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


