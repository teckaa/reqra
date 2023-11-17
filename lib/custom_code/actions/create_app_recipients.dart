// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future createAppRecipients() async {
  // Add your function code here!
  // Create a list of country and capital in json format
  List<Map<String, dynamic>> items = [
    {
      "created_at": DateTime.now(),
      "uuid": "1",
      "type_name": "Phone Number",
      "type_status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "2",
      "type_name": "Wifi Number",
      "type_status": false
    },
    {
      "created_at": DateTime.now(),
      "uuid": "3",
      "type_name": "Meter Number",
      "type_status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "4",
      "type_name": "Smart Card Number",
      "type_status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "5",
      "type_name": "Toll",
      "type_status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "6",
      "type_name": "Bank Account",
      "type_status": false
    }
  ];

  // Get the Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a batch object
  WriteBatch batch = firestore.batch();

  // Loop through the countries list and add each document to the batch
  for (var item in items) {
    // Create a new document reference with a random ID
    DocumentReference docRef =
        firestore.collection("dw_recipients_settings").doc();

    // Add the data to the document
    batch.set(docRef, item);
  }

  try {
    // Commit the batch operation
    await batch.commit();
    print('Batch insertion successful.');
  } catch (e) {
    // Handle errors
    print('Error: $e');
  }
}

void main() {
  createAppRecipients();
}
