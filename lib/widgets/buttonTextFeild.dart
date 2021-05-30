import 'package:curd_firebase/functions/createData.dart';
import 'package:curd_firebase/model/users.dart';
import 'package:flutter/material.dart';

class ButtonField extends StatelessWidget {
  final List<Users> _users;

  ButtonField(this._users);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
      return Card(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  CreateData(_users[index].name, _users[index].name,
                      _users[index].name, _users[index].name)
                      .addUser();
                },
                child: Text('Update'))
          ],
        ),
      );
    },
    itemCount: _users.length,);
  }
}
