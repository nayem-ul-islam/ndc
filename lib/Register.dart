import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

// class Register extends StatefulWidget {
//   @override
//   _RegisterState createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   final fb = FirebaseDatabase.instance;
//   var retrievedName = "";

//   String input = "";

//   @override
//   Widget build(BuildContext context) {
//     final ref = fb.reference().child("$input");
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Registration"),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 'Name',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   shadows: [
//                     Shadow(
//                       blurRadius: 10,
//                       color: Colors.blue,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Flexible(
//               child: TextField(
//                 onChanged: (val) {
//                   setState(
//                     () {
//                       input = val;
//                     },
//                   );
//                 },
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 ref.child("name").set(input);
//               },
//               child: Text("Registration"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 ref.child("patient_name").once().then(
//                   (DataSnapshot data) {
//                     setState(
//                       () {
//                         retrievedName = data.value;
//                       },
//                     );
//                     //print('Data : ${data.value}');
//                   },
//                 );
//               },
//               child: Text("Retrieve data"),
//             ),
//             // FirebaseAnimatedList(
//             //   shrinkWrap: true,
//             //   query: ref,
//             //   itemBuilder: (BuildContext context, DataSnapshot snapshot,
//             //       Animation animation, int index) {
//             //     return ListTile(
//             //       leading: Text(snapshot.value['patient_name']),
//             //     );
//             //   },
//             // ),
//             Text(retrievedName),
//           ],
//         ),
//       ),
//     );
//   }
// }
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    final specialNumber = database.child('1/');

    return Scaffold(
      appBar: AppBar(
        title: Text('Write Examples'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    await specialNumber.set({'patient_id': 1, 'phone': 00});
                    print("Special written");
                  } catch (e) {
                    print('You got an error! $e');
                  }
                },
                child: Text('Simple Test'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
