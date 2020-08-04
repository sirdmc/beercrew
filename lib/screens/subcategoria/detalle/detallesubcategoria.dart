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
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(43, 43, 43, 1)),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            Container(
              width: 250,
              height: 250,
              child: Image.network(subCategoria.foto, fit: BoxFit.fill,),
            ),
            SizedBox(height: 50,),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget est et tellus luctus gravida. Donec sit amet magna posuere, tincidunt dolor ut, sodales urna. Nam ut consectetur odio, quis mattis ligula. Donec sit amet semper elit. Vestibulum eget nulla facilisis, ultrices erat quis, ullamcorper nisl. Praesent mattis tristique lectus. Pellentesque eget eros vel ante tristique efficitur. Sed eu finibus orci. Morbi accumsan pharetra nibh non aliquam. Sed nec rutrum ipsum.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [ Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text('\$ 15,990 ', style: TextStyle(color: Colors.white),),
                )
                ]),
            subCategoria.url != '0' ? Center(
              child: RaisedButton(
                onPressed: launchURL,
                child: Text('Contactar'),
              ),
            ) : Container(),
          ],
        ),
      )
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
