import 'package:beercrew/models/beer.dart';
import 'package:beercrew/models/beercategoria.dart';
import 'package:beercrew/models/brewery.dart';
import 'package:beercrew/services/database.dart';
import 'package:beercrew/widgets/beer/beercategoria.dart';
import 'package:beercrew/widgets/beer/beercategoria_cart.dart';
import 'package:beercrew/widgets/categoria/category.dart';
import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/franc/AndroidStudioProjects/beercrew/lib/widgets/beer/beerbody.dart';
import 'file:///C:/Users/franc/AndroidStudioProjects/beercrew/lib/widgets/home/brewery_list.dart';
import 'package:flutter/material.dart';

class HomeBeer extends StatefulWidget {

  final Brewery brewery;
  String categoriaSeleccionada;
  bool boton = false;
  String buscar;
  bool hayDatos = false;
  HomeBeer({this.brewery});


  @override
  _HomeBeerState createState() => _HomeBeerState(brewery:this.brewery);
}

class _HomeBeerState extends State<HomeBeer> {
  final Brewery brewery;

  _HomeBeerState({this.brewery});
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController;
    String _searchText = "";

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.brewery.id),
      ),
      body: ListView(
              children: <Widget>[
                getBeerCategory(),
                Container(height: 40, decoration: BoxDecoration(color: Colors.black) ,child: Center(child: Text('Cervezas', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),))),
                Container(
                  decoration: BoxDecoration(color: Color.fromRGBO(43, 43, 43, 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Column(
                          children: <Widget>[ SizedBox(
                            width: 180,
                            height: 30,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                              ),
                              child: TextField(
                                controller: _searchController,
                                style: TextStyle(color: Colors.white),
                                obscureText: false, //es para las contraseñas
                                onChanged: (String value) {
                                  if (value.length == 0) {
                                        widget.buscar = null;
                                  } else {
                                        widget.buscar = value.substring(0,1).toUpperCase(); //+ value.substring(1);
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'buscar...',
                                  hintStyle: TextStyle(color: Colors.white),
                                  contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                ),),
                            ),
                          )
                      ]),
                      Column(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.horizontal(right: Radius.circular(100)),),
                            child: IconButton(
                              alignment: Alignment.centerLeft,
                              icon: Icon(Icons.search),
                              color: Colors.white,
                              iconSize: 20,
                              onPressed: () {
                                setState(() {
                                  widget.buscar = widget.buscar;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[SizedBox(width: 120,)],
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(height: 15,),
                          Container(
                            //width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(90)
                            ),
                            child: IconButton(
                              alignment: Alignment.center,
                              color: Colors.white,
                              icon: Icon(Icons.swap_vert),
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
                            ),
                          ),
                          /*RaisedButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(16.0))),
                            child: Container(
                              child: Text('De menor a mayor', style: TextStyle(color: Colors.white, fontSize: 12),),
                            ),
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
                            }, //child: Text('BOTON', style: TextStyle(fontSize: 20, color: Colors.black),),
                          ),*/
                          SizedBox(height: 15,),
                        ],
                      ),
                      Column(children: <Widget>[SizedBox(width: 15,)],)
                    ],
                  ),
                ),


                /*Container(decoration: BoxDecoration(color: Colors.black) ,child: Center(child: Text('Cervezas', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),))),
                Container(child: SizedBox(height: 10), decoration: BoxDecoration(color: Colors.black87, border: Border.all(color: Colors.black87)),),
                Container(
                  decoration: BoxDecoration(color: Colors.black87, border: Border.all(color: Colors.black87)),
                  width: 10.0,
                  height: 25.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 150 ,
                        child: TextField(
                          obscureText: false, //es para las contraseñas
                          onChanged: (String value) {
                            if (value.length == 0) {
                              widget.buscar = null;
                            } else {
                              widget.buscar = value.substring(0,1).toUpperCase(); //+ value.substring(1);
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Buscar',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            widget.buscar = widget.buscar;
                          });
                        },
                      ),
                      RaisedButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16.0))),
                          child: Container(
                            child: Text('De menor a mayor', style: TextStyle(color: Colors.white, fontSize: 12),),
                          ),
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
                          }, //child: Text('BOTON', style: TextStyle(fontSize: 20, color: Colors.black),),
                        ),
                  ]),
                ),*/
                BeerBody(
                  brewery:widget.brewery,
                  selectedCategory: widget.categoriaSeleccionada,
                  boton: widget.boton,
                  buscar: widget.buscar,
                ),
      ])
    );
  }

  Widget getBeerCategory(){
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(43, 43, 43, 1)),
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
                            widget.buscar = null;
                            widget.categoriaSeleccionada = beerCategoria.name;
                          });

                      },
                      url: beerCategoria.url,)
                  );
                }
                widget.hayDatos = true;
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: listaBeerCategorias,
                );
              }
              widget.hayDatos = false;
              return Container();
            }
        )
    );
  }
}
