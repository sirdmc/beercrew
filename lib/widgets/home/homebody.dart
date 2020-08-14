import 'package:beercrew/constants.dart';
import 'package:beercrew/models/brewery.dart';
import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/franc/AndroidStudioProjects/beercrew/lib/widgets/home/brewery_list.dart';
import 'package:flutter/material.dart';
import 'package:beercrew/services/database.dart';
import 'file:///C:/Users/franc/AndroidStudioProjects/beercrew/lib/widgets/categoria/category.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeBody extends StatefulWidget {

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool loading = false;

  List<String> _dropitems = ['TODAS', 'RM', 'I', 'II'];
  String _SelectdType = 'TODAS';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return  ListView(
        children: <Widget>[
          Container(decoration: BoxDecoration(color: Colors.black) ,child: Center(child: Text('Lugares', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),))),
          CategoryContainer(),
          //Container(height: 40 ,decoration: BoxDecoration(color: Colors.black) ,child: Center(child: Text('Cervecerias', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),))),
          Container(
            color: Colors.black,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Row()),
                Expanded(flex: 2 ,child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(child: Text('Cervecerias', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),)),
                  ],
                )),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Colors.grey[900],
                        ),
                        child: DropdownButton<String>(
                            items:_dropitems.map((String val){
                              return DropdownMenuItem<String>(
                                value: val,
                                child: new Text(val, style: TextStyle(color: Colors.white),),
                              );
                            }).toList(),
                            hint:Text(_SelectdType, style: TextStyle(color: Colors.white),),
                            onChanged:(String val){
                              _SelectdType= val;
                              print(_SelectdType);
                              setState(() {});
                            }),
                      ),
                      SizedBox(width: 20,)
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(43, 43, 43, 1)),
            height: height - 245,
            child: FutureBuilder(
                future: _SelectdType == 'TODAS' ? DatabaseService().getBrewerys() : DatabaseService().getBrewerysZona(_SelectdType),
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
                  return kSpinner;
                }
            ),
          ),
        ]);
  }
}
