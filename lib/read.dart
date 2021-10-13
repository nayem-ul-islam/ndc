//import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Read extends StatefulWidget {
  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  String displayText = 'Results go here';
  late List<String> displayTextList;
  final database = FirebaseDatabase.instance.reference();
  //StreamSubscription _dailySpecialStream;

  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    // _dailySpecialStream =
    database.child("3346").onValue.listen((event) {
      //final String patient_name = event.snapshot.value;
      final data = new Map<String, dynamic>.from(event.snapshot.value);
      final patientName = data['patient_name'] as String;
      final bndrId = data['bndr_id'] as String;
      final patientAge = data['patient_age'] as String;
      final organizationName = data['org_name'] as String;
      final patientAddress = data['patient_address'] as String;
      final patientCreateDate = data['patient_create_date'] as String;

      setState(() {
        displayText =
            'Patient name : $patientName, BNDR ID : $bndrId, Patient Age: $patientAge, Patient Address: $patientAddress, Organization Name: $organizationName, Patient Create Date: $patientCreateDate';
        displayTextList = displayText.split(',');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Examples'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Text(displayTextList[0].split(':').last),
              Text(displayTextList[2]),
              Text(displayTextList[3]),
              Text(displayTextList[4]),
              Text(displayTextList[5]),
              Text(displayTextList[6]),
              Text(displayTextList[7]),
              //Text(displayTextList[3].split(':').last),
            ],
          ),
        ),
      ),
    );
  }
}

// @override
// void deactivate() {
//   _dailySpecialStream.cancel();
//   super.deactivate();
// }
