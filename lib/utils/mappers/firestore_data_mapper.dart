import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on FirebaseFirestore {
  DocumentReference userDocument(String userId) {
    return collection("users").doc(userId);
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get notesCollection => collection("notes");

  CollectionReference get todosCollection => collection("todos");
}
