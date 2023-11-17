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

Future createAppPermissions() async {
  // Add your function code here!
  // Create a list of country and capital in json format
  List<Map<String, dynamic>> items = [
    {
      "created_at": DateTime.now(),
      "uuid": "1",
      "permission_desc":
          "Dedicated representatives assisting users with inquiries related to services, ensuring prompt issue resolution and user satisfaction.",
      "permission_name": "Customer Support"
    },
    {
      "created_at": DateTime.now(),
      "uuid": "2",
      "permission_desc":
          "Responsible for creating engaging blogs and news articles, the Content Author enhances user engagement and satisfaction. They work closely with the Marketing Department, providing valuable insights and updates to promote services and maintain the app\u0027s credibility.",
      "permission_name": "Content Author"
    },
    {
      "created_at": DateTime.now(),
      "uuid": "3",
      "permission_desc":
          "Technical experts resolving challenges related to digital transactions, ensuring the smooth operation of services for users.",
      "permission_name": "IT Support"
    },
    {
      "created_at": DateTime.now(),
      "uuid": "4",
      "permission_desc":
          "Individuals utilizing the app for various services, shaping the app\u0027s development through feedback and interactions, and benefiting from its seamless offerings.",
      "permission_name": "User"
    },
    {
      "created_at": DateTime.now(),
      "uuid": "5",
      "permission_desc":
          "The owner/visionary leader behind the app, making strategic decisions, setting the direction, and ensuring alignment with business goals for growth and profitability.",
      "permission_name": "Owner"
    },
    {
      "created_at": DateTime.now(),
      "uuid": "6",
      "permission_desc":
          "Operations-focused professionals managing day-to-day activities, overseeing transactions, and maintaining the app\u0027s integrity in services such as bill payments and utilities for users.",
      "permission_name": "Admin"
    },
    {
      "created_at": DateTime.now(),
      "uuid": "7",
      "permission_desc":
          "Creative professionals promoting services, enhancing brand visibility, and attracting new users, contributing to the app\u0027s growth.",
      "permission_name": "Marketing Department"
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
        firestore.collection("dw_roles_permissions").doc();

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
  createAppPermissions();
}
