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

Future createAppBillServices() async {
  // Add your function code here!
  // Create a list of country and capital in json format
  List<Map<String, dynamic>> items = [
    {
      "created_at": DateTime.now(),
      "uuid": "1",
      "service_name": "Airtime",
      "service_provider": ["GLO", "MTN", "AIRTEL", "9MOBILE"],
      "service_desc":
          "Enable/Disable this service to empower users to effortlessly purchase airtime through your app.",
      "suspension_desc":
          "Dear users, the service has been temporarily suspended due to system maintenance. We apologize for the inconvenience and appreciate your understanding. Stay tuned for further updates. Thank you for your patience.",
      "suspension_title": "This service has been suspended.",
      "service_min_amount": 50,
      "service_status": true,
      "service_max_amount": 100000
    },
    {
      "created_at": DateTime.now(),
      "uuid": "2",
      "service_name": "Data Bundle",
      "service_provider": ["GLO", "MTN", "AIRTEL", "9MOBILE"],
      "service_desc":
          "Enable/Disable this service to empower users to buy data bundles effortlessly through your app.",
      "suspension_desc":
          "Dear users, the service has been temporarily suspended due to system maintenance. We apologize for the inconvenience and appreciate your understanding. Stay tuned for further updates. Thank you for your patience.",
      "suspension_title": "This service has been suspended.",
      "service_min_amount": 0,
      "service_status": true,
      "service_max_amount": 0
    },
    {
      "created_at": DateTime.now(),
      "uuid": "3",
      "service_name": "Transport",
      "service_provider": ["LCC"],
      "service_desc":
          "Enable/Disable this service to empower users to conveniently purchase transport tickets or passes through your app.",
      "suspension_desc":
          "Dear users, the service has been temporarily suspended due to system maintenance. We apologize for the inconvenience and appreciate your understanding. Stay tuned for further updates. Thank you for your patience.",
      "suspension_title": "This service has been suspended.",
      "service_min_amount": 0,
      "service_status": true,
      "service_max_amount": 0
    },
    {
      "created_at": DateTime.now(),
      "uuid": "4",
      "service_name": "Internet/Wifi",
      "service_provider": ["MTN", "SMILE", "IPNX"],
      "service_desc":
          "Enable/Disable this service to empower users to easily purchase Internet/Wifi packages through your app.",
      "suspension_desc":
          "Dear users, the service has been temporarily suspended due to system maintenance. We apologize for the inconvenience and appreciate your understanding. Stay tuned for further updates. Thank you for your patience.",
      "suspension_title": "This service has been suspended.",
      "service_min_amount": 0,
      "service_status": true,
      "service_max_amount": 0
    },
    {
      "created_at": DateTime.now(),
      "uuid": "5",
      "service_name": "Cable TV",
      "service_provider": ["DSTV", "GOTV", "STARTIMES", "SHOWMAX"],
      "service_desc":
          "Enable/Disable this service to empower users to conveniently purchase Cable TV subscriptions through your app.",
      "suspension_desc":
          "Dear users, the service has been temporarily suspended due to system maintenance. We apologize for the inconvenience and appreciate your understanding. Stay tuned for further updates. Thank you for your patience.",
      "suspension_title": "This service has been suspended.",
      "service_min_amount": 0,
      "service_status": true,
      "service_max_amount": 0
    },
    {
      "created_at": DateTime.now(),
      "uuid": "6",
      "service_name": "Electricity",
      "service_provider": [
        "ABUJA DISCO(AEDC)",
        "BENIN DISCO(BEDC)",
        "EKO DISCO(EKEDC)",
        "ENUGU DISCO(EEDC)",
        "IBADAN DISCO(IBEDC)",
        "IKEJA DISCO(IKEDC)",
        "KADUNA DISCO(KEDC)",
        "KANO DISCO(KEDCO)",
        "PORT HARCOURT DISCO(PHED)",
        "YOLA DISCO(YEDC)"
      ],
      "service_desc":
          "Enable/Disable this service to empower users to conveniently purchase electricity tokens through your app.\"",
      "suspension_desc":
          "Dear users, the service has been temporarily suspended due to system maintenance. We apologize for the inconvenience and appreciate your understanding. Stay tuned for further updates. Thank you for your patience.",
      "suspension_title": "This service has been suspended.",
      "service_min_amount": 0,
      "service_status": true,
      "service_max_amount": 0
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
        firestore.collection("billpayments_services").doc();

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
  createAppBillServices();
}
