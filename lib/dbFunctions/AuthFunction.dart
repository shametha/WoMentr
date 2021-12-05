import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> checkUserExist(String docID) async {
  late bool res;
  await FirebaseFirestore.instance
      .collection('Users')
      .doc(docID)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      res = true;
    } else {
      res = false;
    }
  });
  return res;
}

Future<bool> checkLoginCredential(String docID, String password) async {
  bool res = false;
  await FirebaseFirestore.instance
      .collection('Users')
      .doc(docID)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      dynamic data = documentSnapshot.data();
      if (data['password'] == password) res = true;
    } else {
      res = false;
    }
  });
  return res;
}
