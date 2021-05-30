import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curd_firebase/functions/deleteData.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

class TableField extends StatefulWidget {
  @override
  _TableFieldState createState() => _TableFieldState();
}

class _TableFieldState extends State<TableField> {
  String docIdOfSelectedName, selectedNameDoc;

  getUserDoc() {
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

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('MyStudents').snapshots();

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   getUserDoc();
    // });
    // CollectionReference users = FirebaseFirestore.instance.collection('MyStudents');
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Container(
          height: 300,
          child: new ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return new ListTile(
                leading: new Text(document['studentGpa']),
                title: Text(document['studentName']),
                subtitle: Column(
                  children: [
                    Text(document['studentId']),
                    Text(document['studentProgramme'])
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    selectedNameDoc = document['studentName'];
                    getUserDoc();
                    DeleteData(
                            document['studentName'],
                            document['studentId'],
                            document['studentGpa'],
                            document['studentProgramme'])
                        .deleteUser(docIdOfSelectedName);
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
