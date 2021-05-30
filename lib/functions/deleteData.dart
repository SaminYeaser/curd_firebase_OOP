import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curd_firebase/model/users.dart';

class DeleteData extends Users {
  DeleteData(String name, String id, String gpa, String programme)
      : super(name, id, gpa, programme);


  Future<DocumentReference> deleteUser(name) async {
    final userRef = FirebaseFirestore.instance.collection("MyStudents");
    userRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
          userRef
              .doc(name)
              .delete()
              .then((value) => print("User Deleted"))
              .catchError((error) => print("Failed to delete user: $error"));

      });
    });
  }
}
