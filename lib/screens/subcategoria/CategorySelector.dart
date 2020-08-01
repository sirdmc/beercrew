import 'package:beercrew/models/filtrocategoria.dart';

class CategorySelector {
  String categoriaSeleccionada;
  Future<List<FiltroCategoria>> consulta;
  CategorySelector({this.categoriaSeleccionada,this.consulta});

  Future<List<FiltroCategoria>> getConsulta(){
    return consulta;
  }

}