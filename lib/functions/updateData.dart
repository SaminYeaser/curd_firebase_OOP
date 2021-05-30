import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curd_firebase/model/users.dart';

class UpdateDate extends Users{
  UpdateDate(String name, String id, String gpa, String programme) : super(name, id, gpa, programme);

String docIdOfSelectedName, selectedNameDoc;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<DocumentReference> getUserDoc() async {
    final userRef = FirebaseFirestore.instance.collection("MyStudents");
    userRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        print(doc['studentName']);
        if (selectedNameDoc == doc['studentName']) {
          docIdOfSelectedName = doc.id;
        }
      });
    });
  }

  updateData1() {
    users
        .doc(docIdOfSelectedName)
        .update({
      "studentName": name,
      "studentId": id,
      "studentProgramme": programme,
      "studentGpa": gpa
    })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}