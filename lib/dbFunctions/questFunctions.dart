import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> insertQuestion(userID, name, headline, description) async {
  CollectionReference refU = FirebaseFirestore.instance.collection('questions');

  refU.add({
    "userid": "$userID",
    "name": "$name",
    "date": Timestamp.now().toDate(),
    "headline": "$headline",
    "comments": FieldValue.arrayUnion([]),
    "description": "$description",
    "upvote": 0,
    "downvote": 0,
  });
}
