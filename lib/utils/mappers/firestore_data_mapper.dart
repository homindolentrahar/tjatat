import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tjatat/common/constants/constant.dart';

extension FirestoreX on FirebaseFirestore {
  CollectionReference get usersCollection =>
      collection(Constant.USERS_COLLECTION);

  DocumentReference userDocument(String userId) {
    return usersCollection.doc(userId);
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get notesCollection =>
      collection(Constant.NOTES_COLLECTION);

  CollectionReference get todosCollection =>
      collection(Constant.TODOS_COLLECTION);
}
