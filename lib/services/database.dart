import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final firestoreInstance = Firestore.instance;

  void findData() {
    firestoreInstance.collection("beer").getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        print(result.data);
      });
    });
  }

  void findData1() { //recuperar subcollection
    firestoreInstance.collection("beer").getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        firestoreInstance
            .collection("beer")
            .document(result.documentID)
            .collection("beertype")
            .getDocuments()
            .then((querySnapshot) {
          querySnapshot.documents.forEach((result) {
            print(result.data);
          });
        });
      });
    });
  }
}