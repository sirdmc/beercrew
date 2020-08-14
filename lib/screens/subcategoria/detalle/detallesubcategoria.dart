import 'package:beercrew/models/subcategoria.dart';
import 'package:flutter/cupertino.dart';
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                subCategoria.url != '0' ? Center(
                  child: RaisedButton(
                    onPressed: launchURL,
                    child: Text('Web'),
                  ),
                ): Container(),
                SizedBox(width: 10,),
                Center(
                  child: RaisedButton(
                    onPressed: launchPhone,
                    child: Text('Llamar'),
                  ),
                ),
                SizedBox(width: 10,),
                Center(
                  child: IconButton(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    icon: Icon(Icons.mail, color: Colors.white,size: 40,),
                    onPressed: launchMail,
                  ),
                )
                /*Center(
                  child: RaisedButton(
                    onPressed: launchMail,
                    child: Text('Mail'),
                  ),
                )*/
              ],
            ),
          ],
        ),
      )
    );
  }

  launchURL() async {
    String url = subCategoria.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchPhone() async {
    String phone = subCategoria.phone;
    if (await canLaunch('tel:${phone}')) {
      await launch('tel:${phone}');
    } else {
      throw 'Could not launch $phone';
    }
  }

  launchMail() async {
    String mail = subCategoria.mail;
    if (await canLaunch('mailto:${mail}?subject=test%20subject&body=test%20body')) {
      await launch('mailto:${mail}?subject=test%20subject&body=test%20body');
    } else {
      throw 'Could not launch $mail';
    }
  }
}
