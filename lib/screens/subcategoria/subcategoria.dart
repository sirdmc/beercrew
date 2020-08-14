import 'package:beercrew/models/categoria.dart';
import 'package:beercrew/models/filtrocategoria.dart';
import 'package:beercrew/models/subcategoria.dart';
import 'package:beercrew/screens/subcategoria/CategoryListSelector.dart';
import 'package:beercrew/screens/subcategoria/CategorySelector.dart';
import 'package:beercrew/widgets/beer/beercategoria_cart.dart';
import 'package:beercrew/widgets/categoria/category_card.dart';
import 'package:beercrew/widgets/subcategoria/filterCategoria_cuadrado.dart';
import 'file:///C:/Users/franc/AndroidStudioProjects/beercrew/lib/widgets/subcategoria/subcategoria_list.dart';
import 'package:flutter/material.dart';
import 'package:beercrew/services/database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeSubCategoria extends StatefulWidget {

  final Categoria categoria;
  double alturaCategorias = 0;
  HomeSubCategoria({this.categoria});
  CategorySelector categoryListSelector= CategorySelector(

  );

  @override
  _HomeSubCategoriaState createState() => _HomeSubCategoriaState(categoria: this.categoria);
}

class _HomeSubCategoriaState extends State<HomeSubCategoria> {
  final Categoria categoria;
  _HomeSubCategoriaState({this.categoria});
  List<String> _dropitems = ['TODAS', 'RM', 'I', 'II'];
  String _SelectdType = 'TODAS';


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    int alturaBody;
    var bd;

    if(widget.categoryListSelector.categoriaSeleccionada == null){
      if (_SelectdType != 'TODAS' ) {bd = DatabaseService().getSubCategoriaZona(widget.categoria.name, _SelectdType);}
      else {
        bd = DatabaseService().getSubCategoria(widget.categoria.name);
      }
    } else {
      if(_SelectdType != 'TODAS') {
        bd = DatabaseService().getFilterSubCategoriaZona(widget.categoria.name, widget.categoryListSelector.categoriaSeleccionada, _SelectdType);
      } else {
        bd = DatabaseService().getFilterSubCategoria(widget.categoria.name, widget.categoryListSelector.categoriaSeleccionada);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.categoria.name),),
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(43, 43, 43, 1)),
        child: ListView(
          children: <Widget>[
            getCategoryList(),
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
                      Container(child: Text('Detalle', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),)),
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
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(color: Color.fromRGBO(43, 43, 43, 1)),
                height: alturaBody == 0 ? height - 103 : alturaBody,
                child: FutureBuilder(
                  //future: widget.categoryListSelector.categoriaSeleccionada == null ? DatabaseService().getSubCategoria(widget.categoria.name) : DatabaseService().getFilterSubCategoria(widget.categoria.name, widget.categoryListSelector.categoriaSeleccionada) ,
                  future: bd,
                  builder: (BuildContext context, AsyncSnapshot<List<SubCategoria>> snapshot) {
                    if(snapshot.hasData ) {
                      List<SubCategoria> subCategorias = snapshot.data;
                      List<Widget> listaCategorias = new List<Widget>();
                      alturaBody = (subCategorias.length * 40) + 120;
                      for(SubCategoria subCategoria in subCategorias) {
                        listaCategorias.add(
                            ListaSubCategoria(subCategoria: subCategoria,)
                        );
                      }
                      return Container(
                        color: Color.fromRGBO(43, 43, 43, 1),
                        child: Column(
                          children: listaCategorias,
                        ),
                      );
                    }
                    return Container(
                      height: 200,
                      child: SpinKitRotatingCircle(
                        color: Colors.black,
                        size: 50.0,
                      ),
                    );
                  },
                ),
              ),
          ),
        ]),
      ),
    );
  }

  Widget getCategoryList(){
    double alturaCategorias = 120;

    return FutureBuilder(
        future: DatabaseService().getFiltroCategoria(widget.categoria.id),
        builder: (BuildContext context, AsyncSnapshot<List<FiltroCategoria>> snapshot) {
          if(snapshot.hasData ) {
            List<FiltroCategoria> filtroCategorias = snapshot.data;
            List<Widget> listaFiltros = new List<Widget>();
            if(filtroCategorias.length == 0){
              alturaCategorias = 0;
            }
            for(FiltroCategoria filtroCategoria in filtroCategorias) {
              listaFiltros.add(
                  BeerCategoryCard(
                    name: filtroCategoria.name,
                    // brewery: brewery,
                    onTap: () {
                      setState(() {
                        widget.categoryListSelector.categoriaSeleccionada = filtroCategoria.name;
                      });
                    },
                    url: filtroCategoria.url,
                  )
              );
            }
            return Container(
              decoration: BoxDecoration(color: Color.fromRGBO(43, 43, 43, 1)),
              height: alturaCategorias,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: listaFiltros,
              ),
            );
          }
          return Container();
        }
    );
  }
}
