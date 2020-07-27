import 'package:beercrew/models/beer.dart';
import 'package:beercrew/models/beercategoria.dart';
import 'package:beercrew/models/brewery.dart';
import 'package:beercrew/models/categoria.dart';
import 'package:beercrew/models/filtrocategoria.dart';
import 'package:beercrew/models/subcategoria.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final firestoreInstance = Firestore.instance;

  Future<List<Brewery>> getBrewerys() async {
    List<Brewery> brewery = new List();
    await firestoreInstance.collection("beer").orderBy('or').getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        brewery.add(new Brewery(id: result.documentID, price: result['price'], dir: result['dir'], logo: result['logo'], or: result['or']));
      });
    });
    return brewery;
  }

  void getBeerData(Brewery brewery){
    firestoreInstance.collection("beer");
  }

  Future<List<Beer>> getBeers(String name) async { //recuperar subcollection
    List<Beer> beerList = new List();
         await firestoreInstance
            .collection("beer")
            .document(name)
            .collection("beertype")
            .getDocuments()
            .then((querySnapshot) {
            querySnapshot.documents.forEach((result){
              var beerJson = result.data;
              beerList.add(new Beer(id: result.documentID, name: beerJson['name'], origin: beerJson['origin'], type: beerJson['type'], url: beerJson['url'], price: result['price']));
          });
        });
         print('TRAE LA INFO Y PEGALA AQUI PLEASE');
    return beerList;
  }

  Future<List<Beer>> getBeersOrder(String name) async { //recuperar subcollection
    List<Beer> beerList = new List();
    await firestoreInstance
        .collection("beer")
        .document(name)
        .collection("beertype")
        .orderBy('price')
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result){
        var beerJson = result.data;
        beerList.add(new Beer(id: result.documentID, name: beerJson['name'], origin: beerJson['origin'], type: beerJson['type'], url: beerJson['url'], price: result['price']));
      });
    });
    return beerList;
  }

  Future<List<Categoria>> getCategoria() async {
    List<Categoria> categoria = new List();
    await firestoreInstance.collection("categoria").getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        categoria.add(new Categoria(id: result.documentID, name: result['name'], url: result['url']));
      });
    });
    return categoria;
  }

  Future<List<SubCategoria>> getSubCategoria(String name) async {
    List<SubCategoria> subCategoria = new List();
    await firestoreInstance.collection(name).orderBy('or').getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        subCategoria.add(new SubCategoria(id: result.documentID, name: result['name'], or: result['or'], type: result['type'], url: result['url']));
      });
    });
    return subCategoria;
  }

  Future<List<SubCategoria>> getFilterSubCategoria(String name, String type) async {
    List<SubCategoria> subCategoria = new List();
    await firestoreInstance.collection(name).where("type", isEqualTo: type).getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        subCategoria.add(new SubCategoria(id: result.documentID, name: result['name'], or: result['or'], type: result['type']));
      });
    });
    return subCategoria;
  }

  Future<List<FiltroCategoria>> getFiltroCategoria(String name) async { //recuperar subcollection
    List<FiltroCategoria> filtroList = new List();
    await firestoreInstance
        .collection("categoria")
        .document(name)
        .collection("subcategoria")
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result){
        filtroList.add(new FiltroCategoria(id: result.documentID, name: result['name'], url: result['url']));
      });
    });
    return filtroList;
  }

  Future<List<BeerCategoria>> getBeerCategoria() async {
    List<BeerCategoria> beerCategoria = new List();
    await firestoreInstance.collection("beercategoria").getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        beerCategoria.add(new BeerCategoria(id: result.documentID, name: result['name'], url: result['url']));
      });
    });
    return beerCategoria;
  }

  Future<List<Beer>> getFilterBeers(String type, Brewery brewery) async { //recuperar subcollection
    List<Beer> beerList = new List();
    await firestoreInstance
        .collection("beer")
        .document(brewery.id)
        .collection("beertype")
        .where("type", isEqualTo: type)
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result){
        var beerJson = result.data;
        beerList.add(new Beer(id: result.documentID, name: beerJson['name'], origin: beerJson['origin'], type: beerJson['type'], url: beerJson['url'], price: beerJson['price']));
      });
    });
    return beerList;
  }

  Future<List<Beer>> getFilterBeersOrder(String type, Brewery brewery) async { //recuperar subcollection
    List<Beer> beerList = new List();
    await firestoreInstance
        .collection("beer")
        .document(brewery.id)
        .collection("beertype")
        .where("type", isEqualTo: type)
        .orderBy('price')
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result){
        var beerJson = result.data;
        beerList.add(new Beer(id: result.documentID, name: beerJson['name'], origin: beerJson['origin'], type: beerJson['type'], url: beerJson['url'], price: beerJson['price']));
      });
    });
    return beerList;
  }

  Future<List<Beer>> getFilterBeersOrderManual(String type, Brewery brewery) async { //recuperar subcollection
    List<Beer> beerList = new List();
    await firestoreInstance
        .collection("beer")
        .document(brewery.id)
        .collection("beertype")
        .orderBy('price')
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result){
        var beerJson = result.data;
        if(beerJson["type"] == type)
          beerList.add(new Beer(id: result.documentID, name: beerJson['name'], origin: beerJson['origin'], type: beerJson['type'], url: beerJson['url'], price: beerJson['price']));
      });
    });
    return beerList;
  }

  Future<List<Beer>> getBuscarBeers(String buscar, Brewery brewery) async { //recuperar subcollection
    print(buscar);
    List<Beer> beerList = new List();
    await firestoreInstance
        .collection("beer")
        .document(brewery.id)
        .collection("beertype")
        .orderBy('price')
        //.where("buscar", isEqualTo: buscar)
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result){
        var beerJson = result.data;
        if(beerJson["buscar"] == buscar)
          beerList.add(new Beer(id: result.documentID, name: beerJson['name'], origin: beerJson['origin'], type: beerJson['type'], url: beerJson['url'], price: beerJson['price']));
      });
    });
    return beerList;
  }

  Future<List<Beer>> getBuscarFilterBeers(String type, String buscar ,Brewery brewery) async { //recuperar subcollection
    List<Beer> beerList = new List();
    print('consulta buscar filro');
    await firestoreInstance
        .collection("beer")
        .document(brewery.id)
        .collection("beertype")
        .where("type", isEqualTo: type)
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result){
        var beerJson = result.data;
        if(beerJson["buscar"] == buscar)
        beerList.add(new Beer(id: result.documentID, name: beerJson['name'], origin: beerJson['origin'], type: beerJson['type'], url: beerJson['url'], price: beerJson['price']));
      });
    });
    return beerList;
  }

}