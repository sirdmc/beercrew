import 'package:beercrew/models/beer.dart';
import 'package:beercrew/models/brewery.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class HomeDetalle extends StatelessWidget {

  final Beer beer;
  final Brewery brewery;
  HomeDetalle({this.beer, this.brewery});

  @override
  Widget build(BuildContext context) {

    String precio = NumberFormat('#,###').format(beer.price);

    return Scaffold(
      appBar: AppBar(
        title: Text(beer.name),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(43, 43, 43, 1)),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            Container(
              width: 250,
              height: 250,
              child: Image.network('https://www.creativefabrica.com/wp-content/uploads/2020/03/08/Beer-icon-Graphics-3394022-1-1-580x386.jpg', fit: BoxFit.fill,),
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
                child: Text('\$ $precio'
                  ,style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                    ,
                ),
              ),
              )
              ]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 10,),
                Center(
                  child: RaisedButton(
                    onPressed: launchPhone,
                    child: Text('Llamar'),
                  ),
                ),
                SizedBox(width: 10,),
                beer.url != '0' ? Center(
                  child: RaisedButton(
                    onPressed: launchURL,
                    child: Text('Detalle'),
                  ),
                ) : Container(),
                SizedBox(width: 10,),
                Center(
                  child: RaisedButton(
                    onPressed: launchMail,
                    child: Text('Mail'),
                  ),
                ),
                SizedBox(width: 10,),
              ],
            ),
          ],
        ),
      )
    );
  }

  launchURL() async {
    String url = beer.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchPhone() async {
    String phone = brewery.phone;
    if (await canLaunch('tel:${phone}')) {
      await launch('tel:${phone}');
    } else {
      throw 'Could not launch $phone';
    }
  }

  launchMail() async {
    String mail = brewery.mail;
    if (await canLaunch('mailto:${mail}?subject=test%20subject&body=test%20body')) {
      await launch('mailto:${mail}?subject=test%20subject&body=test%20body');
    } else {
      throw 'Could not launch $mail';
    }
  }
}


