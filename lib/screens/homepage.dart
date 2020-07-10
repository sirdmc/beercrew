import 'package:flutter/material.dart';
import 'package:beercrew/widgets/homebody.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BEER CREW'),
      ),
      body: HomeBody(),
    );
  }
}
