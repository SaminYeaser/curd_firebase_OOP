import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseInstance{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('MyStudents');
}