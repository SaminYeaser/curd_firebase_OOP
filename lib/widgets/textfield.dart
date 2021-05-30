import 'package:curd_firebase/functions/createData.dart';
import 'package:curd_firebase/functions/updateData.dart';
import 'package:curd_firebase/widgets/buttonTextFeild.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var nameIpnut = TextEditingController();
    var idInput = TextEditingController();
    var programmeInput = TextEditingController();
    var gpaInput = TextEditingController();

    clearTextInput() {
      nameIpnut.clear();
      idInput.clear();
      programmeInput.clear();
      gpaInput.clear();
    }


    return Card(
      elevation: 5,
      child: Column(
        children: [
          TextField(
            controller: nameIpnut,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Name',
            ),
            onSubmitted: (_) {
              // CreateData(nameIpnut.text, idInput.text, programmeInput.text,
              //         gpaInput.text)
              //     .addUser();
            },
          ),
          TextField(
              controller: idInput,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'ID'),
              onSubmitted: (_) {
                // CreateData(nameIpnut.text, idInput.text, programmeInput.text,
                //         gpaInput.text)
                //     .addUser();
              }),
          TextField(
              controller: programmeInput,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Programme'),
              onSubmitted: (_) {
                // CreateData(nameIpnut.text, idInput.text, programmeInput.text,
                //         gpaInput.text)
                //     .addUser();
              }),
          TextField(
              controller: gpaInput,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'GPA'),
              onSubmitted: (_) {
                // CreateData(nameIpnut.text, idInput.text, programmeInput.text,
                //         gpaInput.text)
                //     .addUser();
              }),
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      CreateData(nameIpnut.text, idInput.text,
                              gpaInput.text, programmeInput.text)
                          .addUser();
                      clearTextInput();
                    },
                    child: Text('Create')),
                ElevatedButton(onPressed: () {
                    UpdateDate(nameIpnut.text, idInput.text,
                        programmeInput.text, gpaInput.text);
                    clearTextInput();
                }, child: Text('Update')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
