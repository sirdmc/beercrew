import 'package:cloud_firestore/cloud_firestore.dart';

class BringInfo { 

  final firestoreInstance = Firestore.instance;


  void onPressed3() { //recuperar data
    firestoreInstance.collection("users").getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        print(result.data);
      });
    });
  }
}


