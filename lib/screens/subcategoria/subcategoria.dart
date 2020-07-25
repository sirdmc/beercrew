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

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    print('EL VALOR ESSSSSSS:  ${widget.categoryListSelector.categoriaSeleccionada}');
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoria.name),),
      body: ListView(
        children: <Widget>[
          getCategoryList(),
          SingleChildScrollView(
          child: Container(
            height: height - 103,
            child: FutureBuilder(
              future: widget.categoryListSelector.categoriaSeleccionada == null ? DatabaseService().getSubCategoria(widget.categoria.name) : DatabaseService().getFilterSubCategoria(widget.categoria.name, widget.categoryListSelector.categoriaSeleccionada) ,
              builder: (BuildContext context, AsyncSnapshot<List<SubCategoria>> snapshot) {
                if(snapshot.hasData ) {
                  List<SubCategoria> subCategorias = snapshot.data;
                  List<Widget> listaCategorias = new List<Widget>();
                  for(SubCategoria subCategoria in subCategorias) {
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
