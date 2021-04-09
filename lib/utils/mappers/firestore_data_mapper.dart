import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tjatat/common/constants/constant.dart';

extension FirestoreX on FirebaseFirestore {
  CollectionReference get usersCollection =>
      collection(Constant.userCollection);

  DocumentReference userDocument(String userId) {
    return usersCollection.doc(userId);
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get notesCollection =>
      collection(Constant.notesCollection);

  CollectionReference get todosCollection =>
      collection(Constant.todosCollection);
}
