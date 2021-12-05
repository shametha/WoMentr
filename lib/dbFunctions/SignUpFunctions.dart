import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> createUser(mobileNumber, nickName, password) async {
  CollectionReference refU = FirebaseFirestore.instance.collection('Users');

  refU.doc(mobileNumber).set({
    "mobilenumber": "$mobileNumber",
    "nickname": "$nickName",
    "password": "$password",
  });
}
