import 'package:flutter/material.dart';

class FilterCuadrado extends StatelessWidget {

  final String name;
  FilterCuadrado({this.name});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(name),);
  }
}
