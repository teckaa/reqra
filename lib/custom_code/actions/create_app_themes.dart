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

Future createAppThemes() async {
  // Add your function code here!
  // Create a list of country and capital in json format
  List<Map<String, dynamic>> items = [
    {
      "created_at": DateTime.now(),
      "uuid": "1",
      "theme_desc":
          "This theme revolves around bill payments and cryptocurrencies.",
      "theme_name": "Lagos"
    },
    {
      "created_at": DateTime.now(),
      "uuid": "2",
      "theme_desc": "This theme revolves around eCommerce.",
      "theme_name": "Enugu"
    },
    {
      "created_at": DateTime.now(),
      "uuid": "3",
      "theme_desc": "This theme centers on bill payments.",
      "theme_name": "Abuja"
    }
  ];

  // Get the Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a batch object
  WriteBatch batch = firestore.batch();

  // Loop through the countries list and add each document to the batch
  for (var item in items) {
    // Create a new document reference with a random ID
    DocumentReference docRef = firestore.collection("dw_themes").doc();

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
  createAppThemes();
}
