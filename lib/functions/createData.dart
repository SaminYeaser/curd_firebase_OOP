import 'package:curd_firebase/model/users.dart';

import '../firebaseInstance.dart';

class CreateData extends Users{
  CreateData(String name, String id, String gpa, String programme) : super(name, id, gpa, programme);

  Future<void> addUser(){
    return FirebaseInstance().users
        .add({
      'studentName': name,
      'studentProgramme': programme,
      'studentGpa': gpa,
      'studentId': id
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}