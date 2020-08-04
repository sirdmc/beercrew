import 'package:beercrew/models/categoria.dart';
import 'package:beercrew/models/filtrocategoria.dart';
import 'package:beercrew/screens/subcategoria/CategorySelector.dart';
import 'package:beercrew/services/database.dart';
import 'package:beercrew/widgets/beer/beercategoria_cart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryListSelector extends StatefulWidget {
  CategorySelector selector;
  Categoria categoria;
  CategoryListSelector({this.selector, this.categoria});
  @override
  _CategoryListSelectorState createState() => _CategoryListSelectorState();
}

class _CategoryListSelectorState extends State<CategoryListSelector> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
