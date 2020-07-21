import 'package:beercrew/models/brewery.dart';
import 'file:///C:/Users/franc/AndroidStudioProjects/beercrew/lib/widgets/home/brewery_list.dart';
import 'package:flutter/material.dart';
import 'package:beercrew/services/database.dart';
import 'file:///C:/Users/franc/AndroidStudioProjects/beercrew/lib/widgets/categoria/category.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeBody extends StatelessWidget {

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return  ListView(
        children: <Widget>[
          Container(decoration: BoxDecoration(color: Colors.black) ,child: Center(child: Text('Lugares', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),))),
          CategoryContainer(),
          Container(decoration: BoxDecoration(color: Colors.black) ,child: Center(child: Text('Cervecerias', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),))),
          Container(
            height: height -103, //es necesario si no hay un error
            child: FutureBuilder(
                future: DatabaseService().getBrewerys(),
                builder: (BuildContext context, AsyncSnapshot<List<Brewery>> snapshot) {
                  if(snapshot.hasData) {
                    loading = false;
                    List<Brewery> brewerys =snapshot.data;
                    List<Widget> tarjetasDeCerveceria = new List<Widget>();
                    for(Brewery brewery in brewerys) {
                      tarjetasDeCerveceria.add(
                          BreweryList(brewery: brewery,)
                      );
                    }
                    return GridView.count(
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: tarjetasDeCerveceria,
                    );
                  }
                  loading = true;
                  return Container(
                    child: SpinKitRotatingCircle(
                      color: Colors.black,
                      size: 50.0,
                    ),
                  );                }
            ),
          ),
        ]);
  }
}
