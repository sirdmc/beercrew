import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BringInfo { 

  final firestoreInstance = Firestore.instance;

  void onPressed() {
    firestoreInstance.collection("users").add(
        {
          "name" : "john",
          "age" : 50,
          "email" : "example@example.com",
        "address" : {
            "street" : "street 24",
            "city" : "new york"
          }
        }).then((value){
      print(value.documentID);
    });
  }

  void onPressed1() async {
    var firebaseUser = await FirebaseAuth.instance
        .currentUser(); //para sacar el usuario
    firestoreInstance.collection("users")
        .document('jEa11oKJtdM1wpsqSBQn')
        .setData(
        {
          "name": "john",
          "age": 55,
          "email": "example@example.com",
          "address": {
            "street": "street 24",
            "city": "new york"
          }
        })
        .then((_) {
      print("success!");
    });
  }
    void onPressed2() async{ //agregar una sub-collection
      firestoreInstance.collection("users").add({
        "name": "john",
        "age": 50,
        "email": "example@example.com",
        "address": {"street": "street 24", "city": "new york"}
      }).then((value) {
        print(value.documentID);
        firestoreInstance
            .collection("users")
            .document(value.documentID)
            .collection("pets")
            .add({"petName": "blacky", "petType": "dog", "petAge": 1});
      });
      
  }

  void onPressed3() { //recuperar data
    firestoreInstance.collection("users").getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        print(result.data);
      });
    });
  }


  void onPressed4() { //recuperar subcollection
    firestoreInstance.collection("users").getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        firestoreInstance
            .collection("users")
            .document(result.documentID)
            .collection("pets")
            .getDocuments()
            .then((querySnapshot) {
          querySnapshot.documents.forEach((result) {
            print(result.data);
          });
        });
      });
    });
  }
  
  void onPressed5() async {
    //recuperar solo un documento
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    firestoreInstance.collection("users").document(firebaseUser.uid)
        .get()
        .then((value) {
      print(value.data);
      //print(value.data["address"]["city"]);
      //print(value.data["name"]);
    });
  }


    void onPressed6() {  //data filtrada
      firestoreInstance
          .collection("users")
          .where("address.city", isEqualTo: "new york")
          .getDocuments()
          .then((value) {
        value.documents.forEach((result) {
          print(result.data);
        });
      });
    }
    
}
  
  //@override
  //Widget build(BuildContext context) {
  //  return Container();
  //}

