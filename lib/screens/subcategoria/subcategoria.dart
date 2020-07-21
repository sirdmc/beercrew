import 'package:beercrew/models/categoria.dart';
import 'package:beercrew/models/filtrocategoria.dart';
import 'package:beercrew/models/subcategoria.dart';
import 'package:beercrew/widgets/beer/beercategoria_cart.dart';
import 'package:beercrew/widgets/categoria/category_card.dart';
import 'package:beercrew/widgets/subcategoria/filterCategoria_cuadrado.dart';
import 'file:///C:/Users/franc/AndroidStudioProjects/beercrew/lib/widgets/subcategoria/subcategoria_list.dart';
import 'package:flutter/material.dart';
import 'package:beercrew/services/database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeSubCategoria extends StatefulWidget {

  final Categoria categoria;
  String categoriaSeleccionada;
  HomeSubCategoria({this.categoria});

  @override
  _HomeSubCategoriaState createState() => _HomeSubCategoriaState(categoria: this.categoria);
}

class _HomeSubCategoriaState extends State<HomeSubCategoria> {

  final Categoria categoria;
  _HomeSubCategoriaState({this.categoria});

  @override
  Widget build(BuildContext context) {

    int alto = 120;
    print('el nombre es!!!!!!!!!!!:  ${categoria.name}');
    var consulta = DatabaseService().getFiltroCategoria(widget.categoria.id);
    var height = MediaQuery.of(context).size.height;
    print('la categoria seleccionada es: ${widget.categoriaSeleccionada}');
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoria.name),),
      body: ListView(
        children: <Widget>[
          getFilterCategory(alto, consulta),
          SingleChildScrollView(
          child: Container(
            height: height - 103,
            child: FutureBuilder(
              future: widget.categoriaSeleccionada == null ? DatabaseService().getSubCategoria(widget.categoria.name) : DatabaseService().getFilterSubCategoria(widget.categoria.name, widget.categoriaSeleccionada) ,
              builder: (BuildContext context, AsyncSnapshot<List<SubCategoria>> snapshot) {
                if(snapshot.hasData ) {
                  List<SubCategoria> subCategorias = snapshot.data;
                  List<Widget> listaCategorias = new List<Widget>();
                  for(SubCategoria subCategoria in subCategorias) {
                    print(subCategoria);
                    listaCategorias.add(
                        ListaSubCategoria(subCategoria: subCategoria,)
                    );
                  }
                  return Container(
                    child: Column(
                      children: listaCategorias,
                    ),
                  );
                }
                return SpinKitRotatingCircle(
                  color: Colors.black,
                  size: 50.0,
                );
              },
            ),
          ),
        ),
      ]),
    );
  }

  Widget getFilterCategory(int alto, var consulta ){

    return Container(
        height: alto == 120 ? 120 : 0, // es necesario xq o si no lanza un error al no mostrarse el icono de libro definido //mueve el alto de la caja
        child: FutureBuilder(
            future: consulta,//DatabaseService().getFiltroCategoria(widget.categoria.id),
            builder: (BuildContext context, AsyncSnapshot<List<FiltroCategoria>> snapshot) {
              if(snapshot.hasData ) {
                List<FiltroCategoria> filtroCategorias = snapshot.data;
                List<Widget> listaFiltros = new List<Widget>();
                for(FiltroCategoria filtroCategoria in filtroCategorias) {
                  listaFiltros.add(
                      BeerCategoryCard(
                        name: filtroCategoria.name,
                       // brewery: brewery,
                       onTap: () {
                          setState(() {
                            print('SET STATEEEEEEEEEEEEE ${filtroCategoria.name}');
                            widget.categoriaSeleccionada = filtroCategoria.name;
                          });
                       },
                        url: filtroCategoria.url,
                  )
                  );
                }
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: listaFiltros,
                );
              }
              alto = 0;
              return Container();

            }
        )
    );
  }
}
