import 'package:beercrew/models/beer.dart';
import 'package:beercrew/models/beercategoria.dart';
import 'package:beercrew/models/brewery.dart';
import 'package:beercrew/services/database.dart';
import 'package:beercrew/widgets/beer/beercategoria.dart';
import 'package:beercrew/widgets/beer/beercategoria_cart.dart';
import 'package:beercrew/widgets/categoria/category.dart';
import 'file:///C:/Users/franc/AndroidStudioProjects/beercrew/lib/widgets/beer/beerbody.dart';
import 'file:///C:/Users/franc/AndroidStudioProjects/beercrew/lib/widgets/home/brewery_list.dart';
import 'package:flutter/material.dart';

class HomeBeer extends StatefulWidget {

  final Brewery brewery;
  String categoriaSeleccionada;
  bool boton = false;
  HomeBeer({this.brewery});

  @override
  _HomeBeerState createState() => _HomeBeerState(brewery:this.brewery);
}

class _HomeBeerState extends State<HomeBeer> {
  final Brewery brewery;

  _HomeBeerState({this.brewery});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.brewery.id),
      ),
      body: ListView(
              children: <Widget>[
                getBeerCategory(),
                Container(decoration: BoxDecoration(color: Colors.black) ,child: Center(child: Text('Cervezas', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),))),
                Container(
                  width: 10.0,
                  height: 25.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[ RaisedButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16.0))),
                          child: Container(
                            child: Text('De menor a mayor', style: TextStyle(color: Colors.white, fontSize: 12),),),
                          onPressed: () {
                            setState(() {
                              if (widget.boton == false) {
                                widget.boton = true;
                                print(widget.boton);
                              } else {
                                widget.boton = false;
                                print(widget.boton);
                              }
                            });
                          },
                          //child: Text('BOTON', style: TextStyle(fontSize: 20, color: Colors.black),),
                        ),
                  ]),
                ),
                BeerBody(
                  brewery:widget.brewery,
                  selectedCategory: widget.categoriaSeleccionada,
                  boton: widget.boton,
                ),
      ])
    );
  }

  Widget getBeerCategory(){
    return Container(
        height: 120, // es necesario xq o si no lanza un error al no mostrarse el icono de libro definido //mueve el alto de la caja
        child: FutureBuilder(
            future: DatabaseService().getBeerCategoria(),
            builder: (BuildContext context, AsyncSnapshot<List<BeerCategoria>> snapshot) {
              if(snapshot.hasData ) {
                List<BeerCategoria> beerCategorias = snapshot.data;
                List<Widget> listaBeerCategorias = new List<Widget>();
                for(BeerCategoria beerCategoria in beerCategorias) {
                  listaBeerCategorias.add(
                      BeerCategoryCard(
                        name: beerCategoria.name,
                        onTap: () {
                          setState(() {
                            widget.categoriaSeleccionada = beerCategoria.name;
                          });

                      },
                      url: beerCategoria.url,)
                  );
                }
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: listaBeerCategorias,
                );
              }
              return Container();
            }
        )
    );
  }
}
